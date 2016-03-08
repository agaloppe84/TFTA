class MenusController < ApplicationController

  before_action :set_foodtruck, except: :destroy
  before_action :set_menu, only: [:show, :edit, :update, :destroy]


  def index
    @menus = @foodtruck.menus
  end

  def show
  end

  def new
    @menu = Menu.new
    @dishes = @foodtruck.dishes
  end

  def create
    @menu = @foodtruck.menus.new(menu_params)
    if @menu.save
      redirect_to foodtruck_menus_path
    else
      render :new
    end
  end

  def update
    @menu = Menu.update(menu_params)
    if @menu.save
      redirect_to foodtruck_dish_menu_path_path
    else
      render :edit
    end
  end

  def edit
     @menu = Menu.find(params[:id])
  end

  def destroy
     @menu = Menu.find(params[:id])
     if @menu.destroy
      redirect_to foodtruck_menus_path
     else
      render :show
     end
  end

   private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def set_foodtruck
    @foodtruck = Foodtruck.find(params[:foodtruck_id])
  end

  def menu_params
    params.require(:menu).permit(:name, :description, :price_cents, :photo)
  end
end
