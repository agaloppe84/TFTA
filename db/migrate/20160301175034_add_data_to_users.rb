class AddDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :trucker, :boolean
  end
end
