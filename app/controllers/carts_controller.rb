class CartsController < ApplicationController

  def create
    prepare_cart

    @menu = Menu.find(params[:menu_id])

    session[:cart] << {
      id: SecureRandom.uuid,
      menu_id: @menu.id,
      name: @menu.name,
      price: @menu.price_cents,
      number_of_meals: params[:order][:number_of_meals]
    }

    redirect_to @menu.foodtruck
  end

  def destroy
    cart_index = session[:cart].find_index { |item| item["id"] == params[:id] }
    session[:cart].delete_at(cart_index)
    redirect_to :back
  end

  private

  def prepare_cart
    if not session[:cart] or session[:cart].class != Array
      session[:cart] = []
    end
  end
end
