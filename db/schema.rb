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

ActiveRecord::Schema.define(version: 20140330053903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holes", force: true do |t|
    t.integer  "number"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "holes", ["course_id"], name: "index_holes_on_course_id", using: :btree

  create_table "rounds", force: true do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "marked_complete", default: false
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree

  create_table "scorecards", force: true do |t|
    t.integer  "round_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scorecards", ["round_id"], name: "index_scorecards_on_round_id", using: :btree
  add_index "scorecards", ["user_id"], name: "index_scorecards_on_user_id", using: :btree

  create_table "turns", force: true do |t|
    t.integer  "scorecard_id"
    t.integer  "hole_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "par",          default: 3
  end

  add_index "turns", ["hole_id"], name: "index_turns_on_hole_id", using: :btree
  add_index "turns", ["par"], name: "index_turns_on_par", using: :btree
  add_index "turns", ["scorecard_id"], name: "index_turns_on_scorecard_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "auth_token"
    t.string   "last_name"
    t.string   "middle_name"
  end

end
