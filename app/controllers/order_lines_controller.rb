class OrderLinesController < ApplicationController
  def create
    @menu = Menu.find(params[:order_line][:menu_id].to_i)
    @foodtruck = @menu.foodtruck
    @order_line = OrderLine.new(order_line_params)
    if @order_line.save
      flash[:notice] = "Votre menu a été ajouté au panier"
    else
      flash[:notice] = "ERREUR"
    end
    redirect_to foodtruck_path(@menu.foodtruck)
  end

  private

  def order_line_params
    params.require(:order_line).permit(:reservation_id, :menu_id, :number_of_meals)
  end
end
