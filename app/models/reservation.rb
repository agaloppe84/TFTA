class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :foodtruck
  has_many :order_lines

  monetize :payment_cents

  validates :shift_datetime, presence: true
  validates :review, presence: true
  validates :mark, presence: true
  validates :payment, presence: true
  validates :address, presence: true

end
