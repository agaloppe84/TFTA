class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :accept, :refuse]
  before_action :set_foodtruck, only: [:show, :new, :create]

  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    @reservation.foodtruck = @foodtruck

    @amount = session[:cart].reduce(0) { |memo, item| memo + (item["price"].to_i * item["number_of_meals"].to_i ) }

    unless current_user.stripe_id
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email: params[:stripeEmail]
      )
      current_user.stripe_id = customer.id
      current_user.save
    end

    charge = Stripe::Charge.create(
      customer: current_user.stripe_id,
      amount:       @amount,  # in cents
      description:  "Payment for reservation #{@reservation.id}",
      currency:     'eur'
    )

    @reservation.update(payment: charge.to_json, status: 'paid')

    if @reservation.save
      session[:cart].each do |item|
        @reservation.order_lines.create(
          number_of_meals: item["number_of_meals"],
          menu_id: item["menu_id"],
          menu_price_cents: item["price"]
        )
      end
      session[:cart] = []
      redirect_to foodtruck_reservation_path(@foodtruck, @reservation), notice: "Well done papa !"
    else
      render "foodtrucks/show", alert: @reservation.errors.full_messages
    end
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to @foodtruck
  end

  def edit
  end

  def update
    update_params = reservation_params.merge({status: :booked})
    if @reservation.update(update_params)
      flash[:notice] = "Votre réservation est validée"
      redirect_to profil_path
    else
      flash[:notice] = "errors"
    end

  end

  def destroy
    @reservation.destroy
    redirect_to reservations_path
  end

  def accept
    @reservation.accepted_at = DateTime.now
    @reservation.save
    redirect_to profil_path, notice: "Super :)"
  end

  def refuse
    @reservation.refused_at = DateTime.now
    @reservation.save
    redirect_to profil_path, alert: "Oh mince, quel dommage :("
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
    @menus = @foodtruck.menus
  end

  def reservation_params
    params.require(:reservation).permit(:shift_datetime, :price, :address, :accepted_at, :refused_at, :review, :mark, :foodtruck_id, :user_id)
  end
end
