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

ActiveRecord::Schema.define(version: 20151215185739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string  "state"
    t.integer "user_id"
    t.integer "listing_id"
    t.date    "start_on"
    t.date    "end_on"
  end

  add_index "bookings", ["listing_id"], name: "index_bookings_on_listing_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "listings", force: :cascade do |t|
    t.string  "image_url"
    t.string  "address"
    t.string  "neighborhood"
    t.text    "description"
    t.integer "price_per_night"
    t.integer "user_id"
    t.string  "nickname"
  end

  add_index "listings", ["user_id"], name: "index_listings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "image_url"
    t.text   "bio"
  end

  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "users"
  add_foreign_key "listings", "users"
end
