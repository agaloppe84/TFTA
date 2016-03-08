class Menu < ActiveRecord::Base
  belongs_to :foodtruck
  belongs_to :user
  has_many :order_lines # keep it for customers
  has_many :menu_dishes, dependent: :destroy
  has_many :dishes, through: :menu_dishes

  has_attachment :photo

  monetize :price_cents

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true

  validates_associated :foodtruck
end

