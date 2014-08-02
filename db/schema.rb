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

ActiveRecord::Schema.define(version: 20140802031713) do

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
    t.integer  "house_price"
    t.integer  "loan_duration"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "joseph_memos", force: true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "words"
    t.text     "videos"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imgs_file_name"
    t.string   "imgs_content_type"
    t.integer  "imgs_file_size"
    t.datetime "imgs_updated_at"
  end

  create_table "ma_reason_slots", force: true do |t|
    t.string   "position"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pair_groups", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "description"
    t.string   "text"
    t.string   "members"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pair_records", force: true do |t|
    t.integer  "user_id"
    t.integer  "pair_group_id"
    t.text     "pair_setting"
    t.text     "pair_result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.text     "category"
    t.string   "img_path"
    t.string   "resized_img_path"
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
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.text     "fb_auth_detail"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
