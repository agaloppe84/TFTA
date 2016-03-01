class Foodtruck < ActiveRecord::Base
  belongs_to :user
  belongs_to :culinary_style
  has_many :dishes
  has_many :menus
  has_many :reservations
  has_many :order_lines, through: :reservations

  validates :name, presence: true
  validates :format, presence: true
  validates :min_capacity, presence: true
  validates :max_capacity, presence: true
  validates :free_radius_max, presence: true
  validates :radius_max, presence: true
  validates :km_price, presence: true
  validates :address, presence: true
end
