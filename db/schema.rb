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

ActiveRecord::Schema.define(version: 2021_07_07_193109) do

  create_table "reservations", force: :cascade do |t|
    t.datetime "heure_reservation"
    t.string "classe"
    t.integer "nombre_places"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vol_id", null: false
    t.integer "user_id", null: false
    t.string "pnr"
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.index ["vol_id"], name: "index_reservations_on_vol_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vols", force: :cascade do |t|
    t.integer "number"
    t.string "departure_airport"
    t.string "arrival_airport"
    t.integer "business_class_seats"
    t.integer "economy_class_seats"
    t.datetime "departure_date"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reservations", "users"
  add_foreign_key "reservations", "vols"
end
