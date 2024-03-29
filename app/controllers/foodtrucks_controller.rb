class FoodtrucksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_foodtruck, only: [:show, :edit, :update]

  def index
    @foodtrucks = Foodtruck.all
  end

  def show
    @reservation = Reservation.new
    @menus = @foodtruck.menus
    @cart = session[:cart]
    # TODO!!!!!! : REINIT session if different foodtruck than the one in session[:cart]
  end

  def new
    @foodtruck = Foodtruck.new
  end

  def create
    @foodtruck = current_user.foodtrucks.new(foodtruck_params)
    if @foodtruck.save
      redirect_to foodtruck_path(@foodtruck)
    else
      render :new
    end
  end

  def edit
    @foodtruck.save
  end

  def update
    if @foodtruck.update(foodtruck_params)
      redirect_to foodtruck_path(@foodtruck)
    else
      render :edit
    end
  end

  private

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:id])
  end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :format, :min_capacity, :max_capacity, :free_radius_max, :radius_max, :km_price, :address, :culinary_style_id, photos: [])
  end
end
