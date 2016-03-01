class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :foodtruck
  has_many :order_lines
end
