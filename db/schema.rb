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

ActiveRecord::Schema.define(version: 20140604072828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "buy_houses", force: true do |t|
    t.integer  "user_id"
    t.integer  "age"
    t.string   "gender"
    t.float    "monthly_income"
    t.text     "job"
    t.hstore   "expenditure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slot_machines", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tw_house_prices", force: true do |t|
    t.string   "city"
    t.string   "town"
    t.string   "transaction_type"
    t.string   "target_type"
    t.date     "date"
    t.string   "address"
    t.float    "land_area"
    t.float    "house_area"
    t.string   "building_type"
    t.float    "parking_price"
    t.float    "total_price"
    t.hstore   "other_information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tw_labor_incomes", force: true do |t|
    t.integer  "year"
    t.text     "gender"
    t.integer  "age"
    t.float    "percentage"
    t.float    "income"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "accumulated_percentage"
  end

  create_table "users", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
