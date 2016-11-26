class AddSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :string, limit: 10
  end
end
