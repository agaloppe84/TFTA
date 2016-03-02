class OrderLine < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :menu

  monetize :menu_price_cents

  validates :menu, presence: true
  validates :reservation, presence: true

  validates :number_of_meals, presence: true
  validates :menu_price, presence: true
end
