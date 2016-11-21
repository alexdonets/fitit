class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user_id
      t.integer :food_id
      t.float :amount
      t.string :day
      t.string :meal

      t.timestamps null: false
    end
  end
end
