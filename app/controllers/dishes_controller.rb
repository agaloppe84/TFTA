class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :create, :new, :update]
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_foodtruck, only: [:index, :edit, :new, :create, :update]


  def index
    @dishes = @foodtruck.dishes
  end

  def show
  end

  def new
    @dish = Dish.new
  end


  def create
    @dish = @foodtruck.dishes.new(dish_params)
    if @dish.save
      redirect_to foodtruck_dishes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to foodtruck_dish_path
    else
      render :edit
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end


  def destroy
    @dish.destroy
    redirect_to foodtruck_dishes_path # route a verifier
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
  end

  def dish_params
    params.require(:dish).permit(:name, :description, :price, :photo, :address, :bio, :gluten, :category, :vegetarien)
  end
end
