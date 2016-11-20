class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :portion
      t.integer :calories
      t.float :fat
      t.float :carb
      t.float :protein
      t.float :fiber
      t.float :sugar
      t.string :category
      t.integer :added_by

      t.timestamps null: false
    end
  end
end
