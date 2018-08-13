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

ActiveRecord::Schema.define(version: 2018_08_08_160346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.boolean "valid_payment_method"
    t.boolean "express_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone"
    t.string "drivers_license_number"
    t.string "drivers_license_state"
    t.string "vehicle_license_plate"
    t.boolean "background_check_clear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "driver_id"
    t.text "items", default: [], array: true
    t.string "warehouse"
    t.money "total", scale: 2
    t.boolean "replacements_ok", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "workflow_state"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["driver_id"], name: "index_orders_on_driver_id"
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "drivers"
end
