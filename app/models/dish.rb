class Dish < ActiveRecord::Base
  belongs_to :foodtruck
  has_many :compositions
end
