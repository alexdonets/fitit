class RemoveFloatFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :float, :integer
  end
end
