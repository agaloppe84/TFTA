class Foodtruck < ActiveRecord::Base
  belongs_to :user
  belongs_to :culinary_style
  has_many :dishes
  has_many :menus
  has_many :reservations
  has_many :order_lines, through: :reservations

  monetize :km_price_cents

  validates :name, presence: true
  validates :format, presence: true
  validates :min_capacity, presence: true
  validates :max_capacity, presence: true
  validates :free_radius_max, presence: true
  validates :radius_max, presence: true
  validates :km_price_cents, presence: true # à revoir : n'apparait pas dans les messages d'erreur de la validation
  validates :address, presence: true
end
