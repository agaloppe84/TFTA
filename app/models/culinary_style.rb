class CulinaryStyle < ActiveRecord::Base
  has_many :foodtrucks

  validates :title, presence: true

  CATEGORIES = %w( indien afro french  )

end
