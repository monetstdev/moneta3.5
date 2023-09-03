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
  create_table "banks", force: :cascade do |t|
    t.string "bango"
    t.string "kanji_name"
    t.string "kana_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kouzas", force: :cascade do |t|
    t.integer "bank_id", null: false
    t.integer "shiten_id", null: false
    t.integer "user_id", null: false
    t.integer "kinyu_shohin", default: 0
    t.string "bangou"
    t.integer "zandaka"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_kouzas_on_bank_id"
    t.index ["shiten_id"], name: "index_kouzas_on_shiten_id"
    t.index ["user_id"], name: "index_kouzas_on_user_id"
  end

  create_table "meisais", force: :cascade do |t|
    t.integer "kouza_id", null: false
    t.integer "kubun", default: 0
    t.integer "kingaku"
    t.string "tekiyou"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kouza_id"], name: "index_meisais_on_kouza_id"
  end

  create_table "shitens", force: :cascade do |t|
    t.integer "bank_id", null: false
    t.string "bango"
    t.string "kanji_name"
    t.string "kana_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_shitens_on_bank_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "bank_id", null: false
    t.string "login_id"
    t.string "kanji_name"
    t.string "kana_name"
    t.string "hashed_password"
    t.string "email"
    t.string "yubin"
    t.string "jusho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_users_on_bank_id"
  end

  add_foreign_key "kouzas", "banks"
  add_foreign_key "kouzas", "shitens"
  add_foreign_key "kouzas", "users"
  add_foreign_key "meisais", "kouzas"
  add_foreign_key "shitens", "banks"
  add_foreign_key "users", "banks"
end
