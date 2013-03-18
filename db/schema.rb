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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130315202914) do

  create_table "odds", :force => true do |t|
    t.string   "game_id"
    t.string   "game_time"
    t.string   "game_teams"
    t.string   "home_line"
    t.string   "away_line"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "away_id"
    t.string   "home_id"
    t.string   "game_date"
  end

  create_table "picks", :force => true do |t|
    t.integer  "user_id"
    t.string   "game_id"
    t.string   "game_teams"
    t.string   "line"
    t.string   "home_or_away"
    t.string   "win_or_lose"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "wager_amount"
    t.string   "game_time"
    t.string   "away_id"
    t.string   "home_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "account_balance", :default => 1000
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
