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

ActiveRecord::Schema.define(version: 20150120125807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "check_id"
    t.text     "q_description"
    t.integer  "q_strength"
    t.boolean  "q_answer",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  default: 0,     null: false
  end

  create_table "checks", force: true do |t|
    t.string   "forename"
    t.string   "name"
    t.string   "org_name"
    t.string   "city"
    t.string   "postal_code"
    t.string   "street"
    t.string   "home_no"
    t.string   "flat_no"
    t.string   "pesel"
    t.string   "regon"
    t.string   "nip"
    t.string   "branch"
    t.boolean  "cancelled",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "level"
    t.string   "pkdfull"
    t.string   "userlogin"
    t.string   "userloginedit"
    t.integer  "lock_version",  default: 0,     null: false
  end

  create_table "levels", force: true do |t|
    t.string   "description"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", default: 0, null: false
  end

  create_table "parameters", force: true do |t|
    t.string   "us_code"
    t.string   "us_name"
    t.string   "us_street"
    t.string   "us_city"
    t.string   "us_house"
    t.string   "us_nip"
    t.string   "us_regon"
    t.string   "us_www"
    t.string   "us_tel"
    t.string   "us_fax"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "us_postalcode"
    t.string   "us_email"
    t.integer  "lock_version",  default: 0, null: false
  end

  create_table "pkds", force: true do |t|
    t.string   "pkd_id"
    t.string   "pkd_name"
    t.string   "branch"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poltaxconns", force: true do |t|
    t.string   "database"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.integer  "lock_version",       default: 0, null: false
  end

  create_table "questions", force: true do |t|
    t.text     "description"
    t.integer  "strength"
    t.boolean  "cancelled",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", default: 0,     null: false
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "forename"
    t.string   "login"
    t.boolean  "kiera",           default: false
    t.integer  "lock_version",    default: 0,     null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
