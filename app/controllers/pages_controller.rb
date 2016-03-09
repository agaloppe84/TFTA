class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @foodtrucks = Foodtruck.all
  end

  def profil
    if current_user.foodtrucker?
      render :profil_foodtrucker
    else
      render :profil_user
    end
  end


end
