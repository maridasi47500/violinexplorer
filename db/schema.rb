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

ActiveRecord::Schema.define(version: 2023_09_10_222657) do

  create_table "mixers", force: :cascade do |t|
    t.boolean "ctrf_room_out_l"
    t.boolean "ctrl_room_out_r"
    t.boolean "_2tr_out_r"
    t.boolean "_2tr_out_l"
    t.boolean "_2tr_in_r"
    t.boolean "_2tr_in_l"
    t.boolean "main_out_l"
    t.boolean "main_out_r"
    t.boolean "phones"
    t.boolean "fx_send"
    t.boolean "phantom"
    t.float "fx_send_value"
    t.boolean "_2tr_to_ctrl_room"
    t.boolean "_2tr_to_mix"
    t.boolean "fx_to_ctrl_room"
    t.float "phones_value"
    t.float "main_mix_value"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "myfiles", force: :cascade do |t|
    t.string "filename"
    t.integer "song_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.text "mycontent"
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "tempo"
    t.integer "date"
    t.string "title"
    t.string "composer"
    t.integer "length"
    t.string "style"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playlistpieces", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "piece_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "artist"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
