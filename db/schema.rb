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

ActiveRecord::Schema.define(version: 2021_08_26_202131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "event_type"
    t.string "name"
    t.datetime "start_time"
    t.bigint "place_id", null: false
    t.bigint "host_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["host_id"], name: "index_events_on_host_id"
    t.index ["place_id"], name: "index_events_on_place_id"
  end

  create_table "events_users", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "invite_id", null: false
    t.boolean "is_confirmed?"
    t.bigint "dancer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dancer_id"], name: "index_events_users_on_dancer_id"
    t.index ["event_id"], name: "index_events_users_on_event_id"
    t.index ["invite_id"], name: "index_events_users_on_invite_id"
  end

  create_table "invites", force: :cascade do |t|
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["owner_id"], name: "index_places_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.boolean "is_pro?", default: false
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "places"
  add_foreign_key "events", "users", column: "host_id"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "invites"
  add_foreign_key "events_users", "users", column: "dancer_id"
  add_foreign_key "places", "users", column: "owner_id"
end
