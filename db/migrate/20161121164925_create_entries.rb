class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :user
      t.integer :food
      t.float :amount
      t.string :day
      t.string :meal

      t.timestamps null: false
    end
  end
end
