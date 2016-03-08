class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :foodtruck
  has_many :order_lines, dependent: :destroy

  monetize :payment_cents

  validates :shift_datetime, presence: true, on: :update
  validates :address, presence: true, on: :update

  validates_associated :user
  validates_associated :foodtruck

end
