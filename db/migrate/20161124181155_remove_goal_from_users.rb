class RemoveGoalFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :goal, :integer
  end
end
