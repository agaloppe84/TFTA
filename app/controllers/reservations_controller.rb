class ReservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
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
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.foodtruck = @foodtruck
    if @reservation.save
      redirect_to foodtruck_reservation_path(@foodtruck, @reservation)
    else
      Rails.logger.info(@reservation.errors.full_messages)
      render :new
    end
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

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
  end

  def reservation_params
    params.require(:reservation).permit(:shift_datetime, :price, :address, :accepted_at, :refused_at, :review, :mark, :foodtruck_id, :user_id)
  end
end
