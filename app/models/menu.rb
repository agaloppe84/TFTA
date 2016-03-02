class Menu < ActiveRecord::Base
  belongs_to :foodtruck
  has_many :order_lines
  has_many :compositions

  monetize :price_cents

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :photo, presence: true

end
