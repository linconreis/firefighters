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

ActiveRecord::Schema.define(version: 20180117174112) do

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

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.boolean "hydrant", default: false
    t.string "reference_point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "brand"
    t.string "board"
    t.bigint "mileage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

  create_table "type_of_cars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
