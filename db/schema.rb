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

ActiveRecord::Schema.define(version: 20170621005843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "country",      limit: 255
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",       limit: 255, default: "pending"
    t.integer  "submitter_id"
    t.float    "rating"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address",      limit: 255
    t.integer  "holes_count"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holes", force: :cascade do |t|
    t.integer  "number"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "holes", ["course_id"], name: "index_holes_on_course_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "photoable_id"
    t.string   "photoable_type", limit: 255
    t.string   "url",            limit: 255
    t.integer  "uploader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["photoable_id", "photoable_type"], name: "index_photos_on_photoable_id_and_photoable_type", using: :btree
  add_index "photos", ["uploader_id"], name: "index_photos_on_uploader_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "post"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_id"
    t.integer  "user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public_recap", default: true, null: false
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id", using: :btree

  create_table "scorecards", force: :cascade do |t|
    t.integer  "round_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scorecards", ["round_id"], name: "index_scorecards_on_round_id", using: :btree
  add_index "scorecards", ["user_id"], name: "index_scorecards_on_user_id", using: :btree

  create_table "turns", force: :cascade do |t|
    t.integer  "scorecard_id"
    t.integer  "hole_id"
    t.integer  "strokes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "par",          default: 3
  end

  add_index "turns", ["hole_id"], name: "index_turns_on_hole_id", using: :btree
  add_index "turns", ["par"], name: "index_turns_on_par", using: :btree
  add_index "turns", ["scorecard_id"], name: "index_turns_on_scorecard_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255
    t.string   "email",                  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest",        limit: 255
    t.string   "auth_token",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "middle_name",            limit: 255
    t.string   "avatar_url",             limit: 255
    t.string   "password_reset_token",   limit: 255
    t.datetime "password_reset_sent_at"
  end

end
