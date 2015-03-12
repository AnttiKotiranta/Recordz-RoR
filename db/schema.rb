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

ActiveRecord::Schema.define(version: 20150311192538) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists_bands", id: false, force: true do |t|
    t.integer "artist_id"
    t.integer "band_id"
  end

  add_index "artists_bands", ["artist_id"], name: "index_artists_bands_on_artist_id"
  add_index "artists_bands", ["band_id"], name: "index_artists_bands_on_band_id"

  create_table "artists_performers", id: false, force: true do |t|
    t.integer "artist_id"
    t.integer "performer_id"
  end

  add_index "artists_performers", ["artist_id"], name: "index_artists_performers_on_artist_id"
  add_index "artists_performers", ["performer_id"], name: "index_artists_performers_on_performer_id"

  create_table "bands", force: true do |t|
    t.string   "name"
    t.text     "info"
    t.integer  "formed"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bands_performers", id: false, force: true do |t|
    t.integer "band_id"
    t.integer "performer_id"
  end

  add_index "bands_performers", ["band_id"], name: "index_bands_performers_on_band_id"
  add_index "bands_performers", ["performer_id"], name: "index_bands_performers_on_performer_id"

  create_table "performers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", force: true do |t|
    t.string   "name"
    t.text     "info"
    t.integer  "year"
    t.integer  "performer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records_users", id: false, force: true do |t|
    t.integer "record_id"
    t.integer "user_id"
  end

  add_index "records_users", ["record_id"], name: "index_records_users_on_record_id"
  add_index "records_users", ["user_id"], name: "index_records_users_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin"
  end

end
