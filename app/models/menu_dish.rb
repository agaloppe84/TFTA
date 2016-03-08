class MenuDish < ActiveRecord::Base
  belongs_to :menu
  belongs_to :dish

  validates_associated :menu
  validates_associated :dish
end
