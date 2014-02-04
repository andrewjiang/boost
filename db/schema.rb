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

ActiveRecord::Schema.define(version: 20140204084356) do

  create_table "activation_stages", force: true do |t|
    t.boolean "car_received"
    t.boolean "uber"
    t.boolean "lyft"
    t.boolean "sidecar"
    t.string  "partner_email"
    t.string  "schedule"
    t.string  "swaps"
    t.integer "driver_application_id"
    t.string  "notes"
  end

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "application_stages", force: true do |t|
    t.string   "phone_screen_status"
    t.boolean  "meets_hard_requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "driver_application_id"
    t.string   "notes"
  end

  create_table "car_listings", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "city"
    t.string   "year"
    t.string   "make"
    t.string   "model"
    t.string   "color"
    t.string   "mileage"
    t.string   "vin"
    t.string   "availability_date"
    t.string   "last_oil_change_date"
    t.string   "last_month_registered_date"
    t.string   "issues"
    t.string   "features"
    t.string   "referred_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "car_picture_file_name"
    t.string   "car_picture_content_type"
    t.integer  "car_picture_file_size"
    t.datetime "car_picture_updated_at"
  end

  create_table "car_slots", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.string   "status"
    t.decimal  "reserved_fee",  precision: 8, scale: 2
    t.decimal  "cancelled_fee", precision: 8, scale: 2
  end

  add_index "car_slots", ["user_id"], name: "user_idx"

  create_table "cars", force: true do |t|
    t.string  "make"
    t.string  "model"
    t.string  "color"
    t.integer "year"
    t.string  "vin"
    t.string  "license_number"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "driver_applications", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "facebook_link"
    t.string   "phone_number"
    t.string   "email"
    t.string   "address"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.string   "drivers_license_file_name"
    t.string   "drivers_license_content_type"
    t.integer  "drivers_license_file_size"
    t.datetime "drivers_license_updated_at"
    t.integer  "drive_days_per_week"
    t.string   "parking_pref"
    t.string   "referred_by"
    t.string   "referral_emails"
    t.string   "partner_emails"
    t.string   "stage"
    t.string   "referral_code"
  end

  create_table "onboarding_stages", force: true do |t|
    t.boolean "signed"
    t.boolean "email_forwarding"
    t.boolean "referral_email"
    t.integer "driver_application_id"
    t.string  "notes"
  end

  create_table "phone_screen_stages", force: true do |t|
    t.integer "fit_score"
    t.boolean "pass"
    t.string  "reason_if_fail"
    t.boolean "clean_driving_record"
    t.string  "commitments"
    t.string  "max_availability"
    t.integer "num_partners"
    t.boolean "reservation_fee"
    t.boolean "scheduling_email"
    t.integer "driver_application_id"
    t.string  "notes"
    t.string  "payment_type"
    t.boolean "applied_to_uber"
    t.boolean "applied_to_lyft"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "address"
    t.string   "zip_code"
    t.integer  "car_id"
    t.text     "default_car_schedule"
    t.text     "gender"
    t.text     "partner_note"
    t.text     "default_car_slot_fees"
  end

  add_index "users", ["car_id"], name: "car_id_idx"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
