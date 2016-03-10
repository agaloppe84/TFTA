class AddPaymentToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :payment, :json
  end
end
