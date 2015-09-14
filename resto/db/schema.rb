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

ActiveRecord::Schema.define(version: 20150913201722) do

  create_table "cuisine_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cuisine_type_id"
  end

  create_table "cuisine_types_restaurants", id: false, force: :cascade do |t|
    t.integer "cuisine_type_id"
    t.integer "restaurant_id"
  end

  add_index "cuisine_types_restaurants", ["cuisine_type_id", "restaurant_id"], name: "restaurant_type_index"

  create_table "reservations", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "customer_name"
    t.datetime "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "party_size"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "restaurant_id"
    t.integer  "capacity"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "province"
    t.text     "description"
    t.string   "foursquare_id"
  end

end
