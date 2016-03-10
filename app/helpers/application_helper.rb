module ApplicationHelper

  def sum_cart(cart)
    cart.reduce(0) { |memo, item| memo + (item["price"].to_i * item["number_of_meals"].to_i ) }
  end

  def sum_cart_symbol(cart)
    humanized_money_with_symbol( sum_cart(cart) / 100 )
  end
end
