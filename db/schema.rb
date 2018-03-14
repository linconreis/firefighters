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

ActiveRecord::Schema.define(version: 20180314124249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "absences", force: :cascade do |t|
    t.string "justification"
    t.time "exit_time"
    t.time "return_time"
    t.date "date_out"
    t.date "return_date"
    t.string "responsible_driver"
    t.string "passengers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "absences_cars", id: false, force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "absence_id", null: false
    t.index ["absence_id", "car_id"], name: "index_absences_cars_on_absence_id_and_car_id"
    t.index ["car_id", "absence_id"], name: "index_absences_cars_on_car_id_and_absence_id"
  end

  create_table "absences_firefighters", id: false, force: :cascade do |t|
    t.bigint "firefighter_id", null: false
    t.bigint "absence_id", null: false
    t.index ["absence_id", "firefighter_id"], name: "index_absences_firefighters_on_absence_id_and_firefighter_id"
    t.index ["firefighter_id", "absence_id"], name: "index_absences_firefighters_on_firefighter_id_and_absence_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.boolean "hydrant", default: false
    t.string "reference_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "district_id"
    t.index ["district_id"], name: "index_addresses_on_district_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "board"
    t.bigint "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_of_cars_id"
    t.index ["type_of_cars_id"], name: "index_cars_on_type_of_cars_id"
  end

  create_table "cars_event_logs", id: false, force: :cascade do |t|
    t.bigint "car_id", null: false
    t.bigint "event_log_id", null: false
    t.index ["car_id", "event_log_id"], name: "index_cars_event_logs_on_car_id_and_event_log_id"
    t.index ["event_log_id", "car_id"], name: "index_cars_event_logs_on_event_log_id_and_car_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_logs", force: :cascade do |t|
    t.bigint "phone"
    t.date "date"
    t.time "exit_time"
    t.time "return_time"
    t.string "requester"
    t.string "descriptive_memorial"
    t.string "measures_taken"
    t.string "comments"
    t.string "on_duty"
    t.string "climate_conditions"
    t.boolean "finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "occurrence_type_id"
    t.bigint "address_id"
    t.index ["address_id"], name: "index_event_logs_on_address_id"
    t.index ["occurrence_type_id"], name: "index_event_logs_on_occurrence_type_id"
  end

  create_table "event_logs_firefighters", id: false, force: :cascade do |t|
    t.bigint "firefighter_id", null: false
    t.bigint "event_log_id", null: false
    t.index ["event_log_id", "firefighter_id"], name: "idx_eventlog_firefighter"
    t.index ["firefighter_id", "event_log_id"], name: "idx_firefighter_eventlog"
  end

  create_table "firefighters", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.bigint "phone"
    t.boolean "commandant"
    t.string "type_blood"
    t.string "password"
    t.string "email"
    t.string "registration"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "renew_password", default: true
  end

  create_table "occurrence_types", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pluviometers", force: :cascade do |t|
    t.float "last_twenty_four"
    t.float "last_forty_eight"
    t.date "date"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "firefighter_id"
    t.index ["firefighter_id"], name: "index_pluviometers_on_firefighter_id"
  end

  create_table "type_of_cars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "districts"
  add_foreign_key "cars", "type_of_cars", column: "type_of_cars_id"
  add_foreign_key "event_logs", "addresses"
  add_foreign_key "event_logs", "occurrence_types"
  add_foreign_key "pluviometers", "firefighters"
end
