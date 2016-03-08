class AddShiftDatetimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :shift_datetime, :datetime
  end
end
