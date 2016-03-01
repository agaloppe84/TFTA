class RenameMealToNumberOfMealsInOrderLines < ActiveRecord::Migration
  def change
    rename_column :order_lines, :meal, :number_of_meals
  end
end
