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

ActiveRecord::Schema.define(version: 2018_07_17_235111) do

  create_table "artists", force: :cascade do |t|
    t.text "description"
    t.string "name", limit: 30
    t.index ["name"], name: "index_artists_on_name", unique: true
  end

  create_table "artists_fans", id: false, force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "fan_id", null: false
    t.index ["artist_id", "fan_id"], name: "index_artists_fans_on_artist_id_and_fan_id"
  end

  create_table "audiences", force: :cascade do |t|
    t.integer "event_id"
    t.integer "fan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_audiences_on_event_id"
    t.index ["fan_id"], name: "index_audiences_on_fan_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", limit: 40, null: false
    t.text "description"
    t.string "place", limit: 50
    t.datetime "start_date", null: false
    t.datetime "end_date", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_events_on_artist_id"
  end

  create_table "fans", force: :cascade do |t|
    t.string "first_name", limit: 25, null: false
    t.string "last_name", limit: 25, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.string "profile_type"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
