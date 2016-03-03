class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create, :new]
  before_action :set_dish, only: [:show, :edit, :update, :destroy]


  def index
    @dishes = Dish.all
  end

  def show
    @dish = Dish.find(params[:id])
  end

  def new
    @foodtruck = Foodtruck.find(params[:foodtruck])
    @dish = Dish.new(@foodtruck)
    #@redirect_to
  end

  def edit
    @dish.save
  end

  def update
    @dish = Dish.find(params[:foodtruck_id])
    if @dish.update(dish_params)
      redirect_to #dish_path(@dish)
    else
      render :edit
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end


  def destroy
    @dish = Dish.find(params[:foodtruck_id])
    @dish.destroy
    redirect_to dishes_path # route a verifier
  end

  private

  def set_dish
    @dish = Dish.find(params[:foodtruck_id])
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :price, :picture, :address, :bio, :gluten, :category, :vegetarien)
  end
end
