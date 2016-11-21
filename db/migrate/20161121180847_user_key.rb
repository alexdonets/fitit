class UserKey < ActiveRecord::Migration
  def change
    add_foreign_key :entries, :user_id
    add_foreign_key :entries, :food_id
    add_foreign_key :foods, :added_by
  end
end
