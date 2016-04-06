class AddDescriptionToFoodtrucks < ActiveRecord::Migration
  def change
    add_column :foodtrucks, :description, :text
  end
end
