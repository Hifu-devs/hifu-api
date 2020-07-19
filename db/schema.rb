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

ActiveRecord::Schema.define(version: 2020_07_19_024651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "start_time"
    t.string "end_time"
    t.string "activity"
    t.integer "party_size"
    t.string "notes"
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.integer "age"
    t.string "race"
    t.string "gender"
    t.string "sat_tracker_address"
    t.string "blood_type"
    t.string "allergies"
    t.string "medical_conditions"
    t.integer "heightCM"
    t.integer "weightKG"
  end

  create_table "waypoints", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "estimated_eta"
    t.bigint "previous_id"
    t.index ["previous_id"], name: "index_waypoints_on_previous_id"
    t.index ["route_id"], name: "index_waypoints_on_route_id"
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "routes", "users"
  add_foreign_key "waypoints", "routes"
end
