json.extract! user, :id, :username, :password, :weight, :height, :age, :activity_level, :goal, :calorie_goal, :fat_goal, :carb_goal, :protein_goal, :fiber_goal, :sugar_goal, :created_at, :updated_at
json.url user_url(user, format: :json)