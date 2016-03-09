class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @foodtruck = Foodtruck.find(params[:id])
  end

end
