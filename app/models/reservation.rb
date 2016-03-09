class Reservation < ActiveRecord::Base
  STATUS = %w(pending booked validated refused)

  belongs_to :user
  belongs_to :foodtruck
  has_many :order_lines, dependent: :destroy

  monetize :payment_cents

  validates :shift_datetime, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :status, inclusion: { in: STATUS }

  validates_associated :user
  validates_associated :foodtruck

  scope :pending_for_user_on_foodtruck, -> (user, foodtruck) { where(status: :pending, foodtruck: foodtruck, user: user) }
end
