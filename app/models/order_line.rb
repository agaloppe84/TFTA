class OrderLine < ActiveRecord::Base
  belongs_to :reservation
  belongs_to :menu

  validates :number_of_meals, presence: true
  validates :menu_price, presence: true
end
