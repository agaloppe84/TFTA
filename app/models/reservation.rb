class Reservation < ActiveRecord::Base
  STATUS = %w(pending paid booked validated refused)

  belongs_to :user
  belongs_to :foodtruck
  has_many :order_lines, dependent: :destroy

  validates :shift_datetime, presence: true, on: :update
  validates :address, presence: true, on: :update
  validates :status, inclusion: { in: STATUS }

  validates_associated :user
  validates_associated :foodtruck

  scope :pending_for_user_on_foodtruck, -> (user, foodtruck) { where(status: :pending, foodtruck: foodtruck, user: user) }

  def total_price
    order_lines.reduce(0) { |memo, order| memo + order.menu_price_cents * order.number_of_meals } / 100
  end

  def pending?
    not accepted_at.present? and not refused_at.present?
  end
end
