class Dish < ActiveRecord::Base

  CATEGORIES =

  belongs_to :foodtruck
  has_many :menu_dishes

  has_attachment :photo

  monetize :price_cents

  def self.categories
    %w(entrée plat dessert accompagnement boisson)
  end

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, inclusion: { in: Dish.categories }

  validates_associated :foodtruck

end



