class Dish < ActiveRecord::Base
  belongs_to :foodtruck
  has_many :compositions

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true
  validates :category, presence: true

end
