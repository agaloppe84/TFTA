class CulinaryStyle < ActiveRecord::Base
  has_many :foodtrucks

  has_attachment :photo

  validates :title, presence: true

  #CATEGORIES = %w( indien afro français mexicain burger bagel )

end
