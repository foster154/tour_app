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

ActiveRecord::Schema.define(version: 20150615130422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "leads", force: true do |t|
    t.integer  "user_id"
    t.integer  "tour_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_info"
    t.boolean  "schedule_showing"
    t.boolean  "get_more_info"
    t.boolean  "send_list"
  end

  add_index "leads", ["user_id"], name: "index_leads_on_user_id", using: :btree

  create_table "photos", force: true do |t|
    t.integer  "tour_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.text     "label"
    t.string   "direct_upload_url",                   null: false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.boolean  "processed",           default: false, null: false
  end

  add_index "photos", ["tour_id"], name: "index_photos_on_tour_id", using: :btree

  create_table "tours", force: true do |t|
    t.integer  "days_remaining"
    t.integer  "user_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "description"
    t.integer  "price"
    t.string   "beds"
    t.string   "baths"
    t.integer  "home_size"
    t.string   "lot_size"
    t.integer  "year_built"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "autoplay_music",         default: true,  null: false
    t.integer  "music_selection"
    t.integer  "theme",                  default: 1,     null: false
    t.boolean  "inactive",               default: false, null: false
    t.boolean  "scheduler",              default: true
    t.boolean  "scheduler_auto_display", default: true
  end

  add_index "tours", ["user_id", "created_at"], name: "index_tours_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "active",                              default: true
    t.boolean  "paying",                              default: false
    t.boolean  "admin",                               default: false
    t.string   "phone",                   limit: 25
    t.string   "company",                 limit: 50
    t.string   "user_url",                limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                               default: "",    null: false
    t.string   "encrypted_password",                  default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "customer_id"
    t.string   "last_4_digits"
    t.string   "user_image_file_name"
    t.string   "user_image_content_type"
    t.integer  "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.boolean  "email_scheduler_leads",               default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
