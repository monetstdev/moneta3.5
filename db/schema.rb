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

ActiveRecord::Schema[7.0].define(version: 2023_09_01_084206) do
  create_table "kouzas", force: :cascade do |t|
    t.string "bank_bangou"
    t.string "shiten_bangou"
    t.integer "user_id", null: false
    t.integer "kinyu_shohin", default: 0
    t.string "bangou"
    t.integer "zandaka"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_kouzas_on_user_id"
  end

  create_table "meisais", force: :cascade do |t|
    t.integer "kouza_id", null: false
    t.integer "kubun", default: 0
    t.integer "kingaku"
    t.integer "zandaka"
    t.string "tekiyou"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kouza_id"], name: "index_meisais_on_kouza_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "bank_bangou"
    t.string "login_id"
    t.string "kanji_name"
    t.string "kana_name"
    t.string "hashed_password"
    t.string "email"
    t.string "yubin"
    t.string "jusho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "kouzas", "users"
  add_foreign_key "meisais", "kouzas"
end
