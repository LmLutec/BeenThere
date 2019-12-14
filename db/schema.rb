# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_14_155122) do

  create_table "reviews", force: :cascade do |t|
    t.string "satisfaction"
    t.string "revisit"
    t.string "suggest"
    t.string "living"
    t.string "stay_length"
    t.string "food_rating"
    t.string "events"
    t.string "comments"
    t.string "cost_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transportations", force: :cascade do |t|
    t.string "method"
    t.string "time_to"
    t.string "time_from"
    t.string "cost_level"
    t.string "from_city"
    t.string "from_state"
    t.string "from_country"
    t.string "to_city"
    t.string "to_state"
    t.string "to_country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "age"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vacations", force: :cascade do |t|
    t.string "type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "city"
    t.string "state"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
