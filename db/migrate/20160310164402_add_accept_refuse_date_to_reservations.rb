class AddAcceptRefuseDateToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :accepted_at, :datetime
    add_column :reservations, :refused_at, :datetime
  end
end
