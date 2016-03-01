class Composition < ActiveRecord::Base
  belongs_to :dish
  belongs_to :menu

end
