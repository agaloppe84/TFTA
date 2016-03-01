class CreateFoodtrucks < ActiveRecord::Migration
  def change
    create_table :foodtrucks do |t|
      t.string :sku
      t.string :name
      t.string :format
      t.integer :min_capacity
      t.integer :max_capacity
      t.integer :free_radius_max
      t.integer :radius_max
      t.monetize :km_price, currency: { present: false }
      t.string :address
      t.references :user, index: true, foreign_key: true
      t.references :culinary_style, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
