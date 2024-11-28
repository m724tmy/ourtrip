# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_11_27_124500) do
  create_table "chat_histories", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.string "role"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_chat_histories_on_room_id"
  end

  create_table "locations", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "description"
    t.integer "cost"
    t.string "reference_url"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_locations_on_room_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "room_users", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_room_users_on_room_id"
    t.index ["user_id"], name: "index_room_users_on_user_id"
  end

  create_table "rooms", charset: "utf8", force: :cascade do |t|
    t.string "room_name", null: false
    t.string "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_locations", charset: "utf8", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_schedule_locations_on_location_id"
    t.index ["schedule_id"], name: "index_schedule_locations_on_schedule_id"
  end

  create_table "schedules", charset: "utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "description"
    t.integer "cost"
    t.string "reference_url"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_schedules_on_room_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_histories", "rooms"
  add_foreign_key "locations", "rooms"
  add_foreign_key "locations", "users"
  add_foreign_key "room_users", "rooms"
  add_foreign_key "room_users", "users"
  add_foreign_key "schedule_locations", "locations"
  add_foreign_key "schedule_locations", "schedules"
  add_foreign_key "schedules", "rooms"
  add_foreign_key "schedules", "users"
end
