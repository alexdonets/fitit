class AddBodyfatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bodyfat, :float
  end
end
