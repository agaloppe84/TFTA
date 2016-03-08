class OrderLine < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :menu

  monetize :menu_price_cents

  validates_associated :menu
  validates_associated :reservation

  validates :number_of_meals, presence: true
end
