class RemoveShiftDatetimeToReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :shift_datetime
  end
end
