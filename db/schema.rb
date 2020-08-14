# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_14_172203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "corners", force: :cascade do |t|
    t.string "name", null: false
    t.text "content", null: false
    t.string "subject"
    t.bigint "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_corners_on_program_id"
  end

  create_table "personalities", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.string "official_url"
    t.bigint "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_personalities_on_program_id"
  end

  create_table "program_songs", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "song_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_program_songs_on_program_id"
    t.index ["song_id"], name: "index_program_songs_on_song_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name", null: false
    t.string "day", null: false
    t.string "time", null: false
    t.string "start_year"
    t.string "end_year"
    t.boolean "ongoing", default: true
    t.string "email"
    t.string "official_url"
    t.text "flow"
    t.text "content", null: false
    t.text "recommend_point"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title", null: false
    t.string "artist", null: false
    t.string "type", null: false
    t.bigint "corner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["corner_id"], name: "index_songs_on_corner_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name", null: false
    t.string "type", null: false
    t.bigint "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_stations_on_program_id"
  end

  add_foreign_key "corners", "programs"
  add_foreign_key "personalities", "programs"
  add_foreign_key "program_songs", "programs"
  add_foreign_key "program_songs", "songs"
  add_foreign_key "songs", "corners"
  add_foreign_key "stations", "programs"
end
