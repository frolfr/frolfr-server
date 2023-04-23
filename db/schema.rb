# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_23_134349) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "country", limit: 255
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "status", limit: 255, default: "pending"
    t.integer "submitter_id"
    t.float "rating"
    t.float "latitude"
    t.float "longitude"
    t.string "address", limit: 255
    t.integer "holes_count"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
  end

  create_table "holes", force: :cascade do |t|
    t.integer "number"
    t.integer "course_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["course_id"], name: "index_holes_on_course_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer "photoable_id"
    t.string "photoable_type", limit: 255
    t.string "url", limit: 255
    t.integer "uploader_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["photoable_id", "photoable_type"], name: "index_photos_on_photoable_id_and_photoable_type"
    t.index ["uploader_id"], name: "index_photos_on_uploader_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "post"
    t.integer "rating"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "course_id"
    t.integer "user_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "course_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.boolean "public_recap", default: true, null: false
    t.index ["course_id"], name: "index_rounds_on_course_id"
  end

  create_table "scorecards", force: :cascade do |t|
    t.integer "round_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.index ["round_id"], name: "index_scorecards_on_round_id"
    t.index ["user_id"], name: "index_scorecards_on_user_id"
  end

  create_table "turns", force: :cascade do |t|
    t.integer "scorecard_id"
    t.integer "hole_id"
    t.integer "strokes"
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.integer "par", default: 3
    t.integer "hole_number", null: false
    t.index ["hole_id"], name: "index_turns_on_hole_id"
    t.index ["par"], name: "index_turns_on_par"
    t.index ["scorecard_id"], name: "index_turns_on_scorecard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "password_digest", limit: 255
    t.string "auth_token", limit: 255
    t.string "last_name", limit: 255
    t.string "middle_name", limit: 255
    t.string "avatar_url", limit: 255
    t.string "password_reset_token", limit: 255
    t.datetime "password_reset_sent_at", precision: nil
  end

end
