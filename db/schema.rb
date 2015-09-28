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

ActiveRecord::Schema.define(version: 20130517133446) do

  create_table "barcodes", force: :cascade do |t|
    t.integer  "number",     null: false
    t.datetime "expiration", null: false
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blood_pressures", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "systolic"
    t.integer  "diastolic"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "broker_configurations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conflict_illnesses", force: :cascade do |t|
    t.string   "description"
    t.integer  "illness_id",    null: false
    t.integer  "medicament_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conflict_meds", force: :cascade do |t|
    t.string   "description"
    t.integer  "medicament_id"
    t.integer  "med_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "illnesses", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "illnesses_patients", id: false, force: :cascade do |t|
    t.integer "illness_id"
    t.integer "patient_id"
  end

  create_table "medicaments", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medicaments_patients", id: false, force: :cascade do |t|
    t.integer "medicament_id"
    t.integer "patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",        null: false
    t.string   "last_name",         null: false
    t.string   "sex"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "height"
    t.float    "body_surface_area"
  end

  create_table "proxy_configurations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "ad_linkup"
    t.boolean  "ldap_linkup"
    t.boolean  "location_services"
    t.boolean  "logging"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pulses", force: :cascade do |t|
    t.integer  "frequency"
    t.integer  "patient_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "description_general"
    t.string   "description_technical"
    t.float    "costs"
    t.string   "server_location"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "site_configurations", force: :cascade do |t|
    t.string   "name",                              null: false
    t.boolean  "geolocation_login", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "service_id"
    t.float    "costs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "weights", force: :cascade do |t|
    t.float    "value"
    t.integer  "patient_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
