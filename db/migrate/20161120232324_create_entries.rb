class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :owner_id
      t.integer :food_id
      t.float :amount
      t.string :day
      t.string :meal

      t.timestamps null: false
    end
  end
end
