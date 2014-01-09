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

ActiveRecord::Schema.define(version: 20140109075359) do

  create_table "driver_applications", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_link"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address"
    t.string   "zip_code"
    t.boolean  "day_pref_sun"
    t.boolean  "day_pref_mon"
    t.boolean  "day_pref_tue"
    t.boolean  "day_pref_wed"
    t.boolean  "day_pref_thu"
    t.boolean  "day_pref_fri"
    t.boolean  "day_pref_sat"
    t.boolean  "park_pref_garage"
    t.boolean  "park_pref_driveway"
    t.boolean  "park_pref_street"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
