class CreateCulinaryStyles < ActiveRecord::Migration
  def change
    create_table :culinary_styles do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
