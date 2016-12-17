class AddBmrAndTdeeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bmr, :int
    add_column :users, :tdee, :int
  end
end
