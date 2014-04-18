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

ActiveRecord::Schema.define(version: 20140417043443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photos", force: true do |t|
    t.integer  "tour_id"
    t.string   "photo"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["tour_id"], name: "index_photos_on_tour_id", using: :btree

  create_table "tours", force: true do |t|
    t.boolean  "active"
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
  end

  add_index "tours", ["user_id", "created_at"], name: "index_tours_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",           limit: 50
    t.boolean  "active",                      default: true
    t.boolean  "paying",                      default: false
    t.boolean  "admin",                       default: false
    t.string   "phone",           limit: 25
    t.string   "company",         limit: 50
    t.string   "user_url",        limit: 100
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
