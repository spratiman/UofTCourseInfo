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

ActiveRecord::Schema.define(version: 20170318002602) do

  create_table "comments", force: :cascade do |t|
    t.text     "body",       default: "", null: false
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_comments_on_ancestry"
    t.index ["course_id"], name: "index_comments_on_course_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "exclusions"
    t.text     "prerequisites"
    t.text     "breadths"
    t.index ["code"], name: "index_courses_on_code", unique: true
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "value",       default: 3, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "rating_type"
    t.index ["course_id"], name: "index_ratings_on_course_id"
    t.index ["user_id", "course_id", "rating_type"], name: "index_ratings_on_user_id_and_course_id_and_rating_type", unique: true
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "user_course_relations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.text     "body"
    t.boolean  "has_dropped",   default: false
    t.boolean  "is_waitlisted", default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["course_id"], name: "index_user_course_relations_on_course_id"
    t.index ["user_id"], name: "index_user_course_relations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.text     "about"
    t.date     "birthdate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
