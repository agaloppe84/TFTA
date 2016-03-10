class AddPhotosToFoodtrucks < ActiveRecord::Migration
  def change
    add_column :foodtrucks, :photo, :string
  end
end
