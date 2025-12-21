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

ActiveRecord::Schema[8.1].define(version: 2025_12_21_102600) do
  create_table "archives", force: :cascade do |t|
    t.datetime "archive_date", null: false
    t.string "archive_type", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_archives_on_book_id"
  end

  create_table "band_members", force: :cascade do |t|
    t.integer "band_id", null: false
    t.datetime "created_at", null: false
    t.string "instrument"
    t.string "name"
    t.integer "no_of_member"
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_members_on_band_id"
  end

  create_table "bands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "established_year"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.datetime "created_at", null: false
    t.string "description"
    t.string "isbn"
    t.decimal "price"
    t.integer "published_year"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.datetime "exp", null: false
    t.string "jti", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "archives", "books"
  add_foreign_key "band_members", "bands"
end
