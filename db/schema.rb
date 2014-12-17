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

ActiveRecord::Schema.define(version: 20141217134154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["message_id"], name: "index_comments_on_message_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "diets", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.text     "description"
    t.text     "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "country"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "participation"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "experiences", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "create"
    t.string   "destroy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "visibility"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "supplements", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "symptoms", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_diets", force: true do |t|
    t.integer  "user_id"
    t.integer  "diet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_diets", ["diet_id"], name: "index_user_diets_on_diet_id", using: :btree
  add_index "user_diets", ["user_id"], name: "index_user_diets_on_user_id", using: :btree

  create_table "user_interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_interests", ["interest_id"], name: "index_user_interests_on_interest_id", using: :btree
  add_index "user_interests", ["user_id"], name: "index_user_interests_on_user_id", using: :btree

  create_table "user_medications", force: true do |t|
    t.integer  "user_id"
    t.integer  "medication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_medications", ["medication_id"], name: "index_user_medications_on_medication_id", using: :btree
  add_index "user_medications", ["user_id"], name: "index_user_medications_on_user_id", using: :btree

  create_table "user_supplements", force: true do |t|
    t.integer  "user_id"
    t.integer  "supplement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_supplements", ["supplement_id"], name: "index_user_supplements_on_supplement_id", using: :btree
  add_index "user_supplements", ["user_id"], name: "index_user_supplements_on_user_id", using: :btree

  create_table "user_symptoms", force: true do |t|
    t.integer  "user_id"
    t.integer  "symptom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_symptoms", ["symptom_id"], name: "index_user_symptoms_on_symptom_id", using: :btree
  add_index "user_symptoms", ["user_id"], name: "index_user_symptoms_on_user_id", using: :btree

  create_table "user_wellbeings", force: true do |t|
    t.integer  "user_id"
    t.integer  "wellbeing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_wellbeings", ["user_id"], name: "index_user_wellbeings_on_user_id", using: :btree
  add_index "user_wellbeings", ["wellbeing_id"], name: "index_user_wellbeings_on_wellbeing_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.date     "birth_date"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "zipcode"
    t.string   "mood"
    t.string   "picture"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wellbeings", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
