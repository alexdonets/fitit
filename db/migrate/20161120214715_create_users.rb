class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.float :weight
      t.float :height
      t.integer :age
      t.integer :activity_level
      t.integer :goal
      t.integer :calorie_goal
      t.integer :fat_goal
      t.integer :carb_goal
      t.integer :protein_goal
      t.integer :fiber_goal
      t.integer :sugar_goal

      t.timestamps null: false
    end
  end
end
