class Foodtruck < ActiveRecord::Base
  belongs_to :user
  belongs_to :culinary_style
  has_many :dishes, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :reservations, dependent: :destroy

  has_attachments :photos

  monetize :km_price_cents

  validates :name, presence: true
  validates :format, presence: true
  validates :min_capacity, presence: true
  validates :max_capacity, presence: true
  validates :free_radius_max, presence: true
  validates :radius_max, presence: true
  validates :km_price, presence: true
  validates :address, presence: true

  validates_associated :user
  validates_associated :culinary_style

  def self.format
    ["Food-Truck", "Food-Bike", "Stand-Mobile"]
  end
end
