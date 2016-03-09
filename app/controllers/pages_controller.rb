class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @foodtrucks = Foodtruck.all
  end

  def profil
    if current_user.foodtrucker?
     @foodtruck = current_user.foodtrucks.first
   end
  end

end
