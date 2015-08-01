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

ActiveRecord::Schema.define(version: 20150728224155) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "species"
    t.integer  "age"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["name"], name: "index_characters_on_name", using: :btree

  create_table "resource_types", force: true do |t|
    t.string   "type_name"
    t.string   "value_1_header_i"
    t.string   "value_2_header"
    t.string   "value_3_header"
    t.string   "value_4_header"
    t.string   "value_5_header"
    t.string   "value_6_header"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.date     "date_of_birth"
  end

  add_index "users", ["email_address"], name: "index_users_on_email_address", using: :btree

  create_table "writer_resources", force: true do |t|
    t.integer  "user_id"
    t.integer  "resource_type_id"
    t.string   "resource_name"
    t.string   "resource_value_1_i"
    t.string   "resource_value_2"
    t.string   "resource_value_3"
    t.string   "resource_value_4"
    t.text     "resource_value_5"
    t.text     "resource_value_6"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "writer_resources", ["resource_value_1_i"], name: "index_writer_resources_on_resource_value_1_i", using: :btree

end
