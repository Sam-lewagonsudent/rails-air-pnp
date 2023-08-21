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

ActiveRecord::Schema[7.0].define(version: 2023_08_21_110207) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pools", force: :cascade do |t|
    t.decimal "price"
    t.text "address"
    t.text "description"
    t.float "length"
    t.float "width"
    t.float "depth"
    t.string "shape"
    t.text "facilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_pools_on_users_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "deposit"
    t.boolean "owner_acceptation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.bigint "pools_id"
    t.index ["pools_id"], name: "index_reservations_on_pools_id"
    t.index ["users_id"], name: "index_reservations_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.text "bank_information"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pools", "users", column: "users_id"
  add_foreign_key "reservations", "pools", column: "pools_id"
  add_foreign_key "reservations", "users", column: "users_id"
end
