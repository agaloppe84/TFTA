class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @foodtrucks = Foodtruck.all
  end
end
