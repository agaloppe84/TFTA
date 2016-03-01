class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.monetize :price, currency: { present: false }
      t.string :photo
      t.string :category
      t.boolean :gluten
      t.boolean :bio
      t.boolean :vegetarien
      t.references :foodtruck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
