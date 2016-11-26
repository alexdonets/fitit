class AddActivityLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activity_level, :float
  end
end
