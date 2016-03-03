class CulinaryStyle < ActiveRecord::Base
  has_many :foodtrucks

  validates :title, presence: true

  def self.category
    %w( indien afro français mexicain burger bagel )
  end

  #CATEGORIES = %w( indien afro français mexicain burger bagel )

end
