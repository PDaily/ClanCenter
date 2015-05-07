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

ActiveRecord::Schema.define(version: 20150505211454) do

  create_table "game_modes", force: :cascade do |t|
    t.string   "title"
    t.integer  "total_players"
    t.integer  "game_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "game_modes", ["game_id"], name: "index_game_modes_on_game_id"

  create_table "game_sessions", force: :cascade do |t|
    t.string   "notes"
    t.integer  "game_id"
    t.integer  "game_mode_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.date     "game_date"
  end

  add_index "game_sessions", ["game_id"], name: "index_game_sessions_on_game_id"
  add_index "game_sessions", ["game_mode_id"], name: "index_game_sessions_on_game_mode_id"

  create_table "game_sessions_users", force: :cascade do |t|
    t.integer "game_session_id"
    t.integer "user_id"
  end

  add_index "game_sessions_users", ["game_session_id"], name: "index_game_sessions_users_on_game_session_id"
  add_index "game_sessions_users", ["user_id"], name: "index_game_sessions_users_on_user_id"

  create_table "games", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.string   "time_zone"
    t.string   "xbox_name"
    t.string   "steam_name"
    t.string   "twitch_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
