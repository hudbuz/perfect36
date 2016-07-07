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

ActiveRecord::Schema.define(version: 20160706192505) do

  create_table "answer_keys", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "question"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "answer_key_id"
    t.integer  "section_id"
    t.string   "correct_answer"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "test_id"
    t.string   "answer_choice"
    t.integer  "question"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "score",         default: 0
    t.string   "code"
    t.integer  "section_id"
    t.integer  "answer_key_id"
    t.integer  "user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.integer  "test_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "answer_key_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "status",        default: "incomplete"
    t.integer  "answer_key_id"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role",                   default: 0
    t.integer  "tutor_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
