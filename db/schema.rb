# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161125180533) do

  create_table "entries", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "food_id",    limit: 4
    t.float    "amount",     limit: 24
    t.string   "day",        limit: 255
    t.string   "meal",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "portion",             limit: 255
    t.integer  "calories",            limit: 4
    t.float    "fat",                 limit: 24
    t.float    "carb",                limit: 24
    t.float    "protein",             limit: 24
    t.float    "fiber",               limit: 24
    t.float    "sugar",               limit: 24
    t.string   "category",            limit: 255
    t.float    "sodium",              limit: 24
    t.float    "potassium",           limit: 24
    t.float    "cholesterol",         limit: 24
    t.float    "saturated_fat",       limit: 24
    t.float    "polyunsaturated_fat", limit: 24
    t.float    "monounsaturated_fat", limit: 24
    t.float    "trans_fat",           limit: 24
    t.integer  "added_by",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",       limit: 255
    t.string   "email",          limit: 255
    t.string   "password_hash",  limit: 255
    t.string   "salt",           limit: 255
    t.float    "weight",         limit: 24
    t.float    "height",         limit: 24
    t.integer  "age",            limit: 4
    t.integer  "calorie_goal",   limit: 4
    t.integer  "fat_goal",       limit: 4
    t.integer  "carb_goal",      limit: 4
    t.integer  "protein_goal",   limit: 4
    t.integer  "fiber_goal",     limit: 4
    t.integer  "sugar_goal",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "activity_level", limit: 24
    t.float    "goal",           limit: 24
    t.string   "sex",            limit: 10
    t.float    "bodyfat",        limit: 24
    t.integer  "bmr",            limit: 4
    t.integer  "tdee",           limit: 4
  end

end
