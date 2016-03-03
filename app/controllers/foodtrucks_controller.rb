class FoodtrucksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create]
  before_action :set_foodtruck, only: [:show, :edit, :update, :destroy]

  def index
    @foodtrucks = Foodtruck.all
    #@markers = Gmaps4rails.build_markers(@foodtrucks) do |foodtruck, marker|
      #marker.lat foodtruck.latitude
      #marker.lng foodtruck.longitude
    #end
  end

  def show
    @foodtruck = Foodtruck.find(params[:id])
    #@markers = Gmaps4rails.build_markers(@foodtruck) do |foodtruck, marker|
      #marker.lat foodtruck.latitude
      #marker.lng foodtruck.longitude
    #end
  end

  def new
    @foodtruck = Foodtruck.new
  end

  def edit
    @foodtruck.save
  end

  def create
    @foodtruck = Foodtruck.new(foodtruck_params)
    @foodtruck.user = current_user
    if @foodtruck.save
      redirect_to foodtruck_path(@foodtruck)
    else
      Rails.logger.info(@foodtruck.errors.full_messages)
      render :new
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def update
    if @foodtruck.update(foodtruck_params)
      redirect_to foodtruck_path(@foodtruck)
    else
      render :edit
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    #@foodtruck.destroy
    #redirect_to foodtrucks_path
  end

  private

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:id])
  end

  def foodtruck_params
    params.require(:foodtruck).permit(:name, :format, :min_capacity, :max_capacity, :free_radius_max, :radius_max, :km_price, :address, :culinary_style_id)
  end
end
