class DropCompositions < ActiveRecord::Migration
  def change
    drop_table :compositions
  end
end
