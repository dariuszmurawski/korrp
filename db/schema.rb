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

ActiveRecord::Schema.define(version: 20141106085257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "check_id"
    t.text     "q_description"
    t.integer  "q_strength"
    t.boolean  "q_answer",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.boolean  "cancelled",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score"
    t.string   "level"
    t.string   "pkdfull"
    t.string   "userlogin"
  end

  create_table "levels", force: true do |t|
    t.string   "description"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  create_table "pkds", force: true do |t|
    t.string   "pkd_id"
    t.string   "pkd_name"
    t.string   "branch"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "description"
    t.integer  "strength"
    t.boolean  "cancelled",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
