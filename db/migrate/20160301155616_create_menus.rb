class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.string :description
      t.monetize :price, currency: { present: false }
      t.string :photo
      t.references :foodtruck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
