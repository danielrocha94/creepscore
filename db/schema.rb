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

ActiveRecord::Schema.define(version: 20161026102327) do

  create_table "league_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "name"
    t.string   "tier"
    t.string   "queue"
    t.integer  "player_or_team_id"
    t.string   "player_or_team_name"
    t.string   "division"
    t.integer  "league_points"
    t.integer  "wins"
    t.integer  "losses"
    t.string   "playstyle"
    t.boolean  "isHotStreak"
    t.boolean  "isVeteran"
    t.boolean  "isFreshBlood"
    t.boolean  "isInactive"
    t.integer  "miniseries_target"
    t.integer  "miniseries_wins"
    t.integer  "miniseries_loses"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["player_or_team_id"], name: "index_league_entries_on_player_or_team_id", unique: true, using: :btree
  end

  create_table "summoner_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "summoner_id"
    t.string   "name"
    t.integer  "icon"
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["summoner_id"], name: "index_summoner_informations_on_summoner_id", unique: true, using: :btree
  end

end
