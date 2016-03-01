class CulinaryStyle < ActiveRecord::Base
  has_many :foodtrucks

  validates :title, presence: true
end
