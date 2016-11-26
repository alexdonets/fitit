class RemoveSexFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :sex, :integer
  end
end
