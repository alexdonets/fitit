json.extract! food, :id, :name, :portion, :calories, :fat, :carb, :protein, :fiber, :sugar, :category, :added_by, :created_at, :updated_at
json.url food_url(food, format: :json)