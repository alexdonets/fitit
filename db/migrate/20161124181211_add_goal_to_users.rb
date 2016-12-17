class AddGoalToUsers < ActiveRecord::Migration
  def change
    add_column :users, :goal, :float
  end
end
