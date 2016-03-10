class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :shift_datetime
      t.string :review
      t.integer :mark
      t.monetize :payment, currency: { present: false }
      t.string :address
      t.references :user, index: true, foreign_key: true
      t.references :foodtruck, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
