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

ActiveRecord::Schema.define(version: 20141101144932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "home_player_id",             null: false
    t.integer  "away_player_id",             null: false
    t.integer  "home_goals",     default: 0
    t.integer  "away_goals",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["home_player_id", "away_player_id"], name: "index_games_on_home_player_id_and_away_player_id", unique: true, using: :btree

  create_table "players", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email_md5"
  end

  add_index "players", ["email"], name: "index_players_on_email", unique: true, using: :btree
  add_index "players", ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true, using: :btree

  create_table "scores", force: true do |t|
    t.integer  "player_id",              null: false
    t.integer  "games",      default: 0
    t.integer  "points",     default: 0
    t.integer  "wins",       default: 0
    t.integer  "draws",      default: 0
    t.integer  "loses",      default: 0
    t.integer  "gp",         default: 0
    t.integer  "gc",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["player_id"], name: "index_scores_on_player_id", unique: true, using: :btree

end
