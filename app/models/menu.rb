class Menu < ActiveRecord::Base
  belongs_to :foodtruck
  belongs_to :user
  has_many :order_lines
  has_many :menu_dishes
  has_many :dishes, through: :menu_dishes

  monetize :price_cents
end
