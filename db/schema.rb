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

ActiveRecord::Schema.define(version: 20151129021308) do

  create_table "dog_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.string   "name",        limit: 255
    t.integer  "age",         limit: 4
    t.integer  "dog_type_id", limit: 4
    t.integer  "active",      limit: 4
    t.integer  "hair",        limit: 4
    t.integer  "bark",        limit: 4
    t.integer  "tack",        limit: 4
    t.text     "comment",     limit: 65535
    t.string   "image",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "dogs", ["dog_type_id"], name: "index_dogs_on_dog_type_id", using: :btree
  add_index "dogs", ["user_id"], name: "index_dogs_on_user_id", using: :btree

  create_table "receives", force: :cascade do |t|
    t.integer  "request_id",      limit: 4
    t.integer  "receive_user_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "request_user_id", limit: 4
    t.integer  "commit_user_id",  limit: 4
    t.string   "name",            limit: 255
    t.datetime "datetime"
    t.integer  "time",            limit: 4
    t.text     "comment",         limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "name",                   limit: 255
    t.string   "image",                  limit: 255
    t.integer  "postcord",               limit: 4
    t.string   "address",                limit: 255
    t.text     "profile",                limit: 65535
    t.string   "uid",                    limit: 255
    t.string   "provider",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "dogs", "dog_types"
  add_foreign_key "dogs", "users"
end
