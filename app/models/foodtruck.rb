class Foodtruck < ActiveRecord::Base
  belongs_to :user
  belongs_to :culinary_style
end
