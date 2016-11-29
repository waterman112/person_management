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

ActiveRecord::Schema.define(version: 20161129040336) do

  create_table "grades", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.integer "session_id", limit: 4
  end

  create_table "logs", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.integer "state_id",   limit: 4
    t.string  "content",    limit: 255
    t.date    "start_date"
    t.date    "end_date"
  end

  create_table "persons", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.string  "sex",           limit: 255
    t.integer "age",           limit: 4
    t.string  "id_card",       limit: 255
    t.string  "role",          limit: 255
    t.integer "phone",         limit: 4
    t.string  "email",         limit: 255
    t.integer "person_number", limit: 4
    t.integer "state_id",      limit: 4
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "session_name", limit: 4
    t.integer "class_name",   limit: 4
    t.integer "state_id",     limit: 4
  end

  create_table "states", force: :cascade do |t|
    t.string  "state_name", limit: 255
    t.integer "role",       limit: 4
  end

end
