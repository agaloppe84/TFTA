class Menu < ActiveRecord::Base
  belongs_to :foodtruck
  has_many :order_lines
  has_many :compositions
end
