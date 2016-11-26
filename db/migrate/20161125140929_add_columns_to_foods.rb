class AddColumnsToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :sodium, :float
    add_column :foods, :potassium, :float
    add_column :foods, :cholesterol, :float
    add_column :foods, :saturated_fat, :float
    add_column :foods, :polyunsaturated_fat, :float
    add_column :foods, :monounsaturated_fat, :float
    add_column :foods, :trans_fat, :float
  end
end
