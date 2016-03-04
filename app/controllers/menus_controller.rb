class MenusController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :create, :new, :update]
  before_action :set_foodtruck, only: [:index, :edit, :new, :create, :update]



. def index
    @menus = @foodtruck.menus
  end

  def show
  end

  def new
    @menu = Menu.new(:foodtruck_id)
  end

  def create
    @menu = Menu.find(params[:id])
    if @menu.save
      redirect_to _path
    else
      render :new
    end
  end

  def update
    @menu = Menu.update(menu_params)
    if @menu.save
      redirect_to _path
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
     @menu = Menu.find(params[:id])
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
