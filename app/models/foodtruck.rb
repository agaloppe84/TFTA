class Foodtruck < ActiveRecord::Base
  belongs_to :user
  belongs_to :culinary_style
  has_many :dishes
  has_many :menus
  has_many :reservations
end
