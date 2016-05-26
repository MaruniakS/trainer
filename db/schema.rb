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

ActiveRecord::Schema.define(version: 20160526165915) do

  create_table "events", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_analogs", force: :cascade do |t|
    t.integer  "exercise_id"
    t.integer  "analog_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exercise_analogs", ["analog_id"], name: "index_exercise_analogs_on_analog_id"
  add_index "exercise_analogs", ["exercise_id"], name: "index_exercise_analogs_on_exercise_id"

  create_table "exercise_descriptions", force: :cascade do |t|
    t.text     "step"
    t.integer  "order"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "exercise_descriptions", ["exercise_id"], name: "index_exercise_descriptions_on_exercise_id"

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "youtube_url"
    t.integer  "muscle_group_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "exercise_image_file_name"
    t.string   "exercise_image_content_type"
    t.integer  "exercise_image_file_size"
    t.datetime "exercise_image_updated_at"
  end

  add_index "exercises", ["muscle_group_id"], name: "index_exercises_on_muscle_group_id"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "full_name"
    t.string   "email"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "muscle_groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "muscle_group_image_file_name"
    t.string   "muscle_group_image_content_type"
    t.integer  "muscle_group_image_file_size"
    t.datetime "muscle_group_image_updated_at"
  end

  create_table "program_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "training_day_exercises", force: :cascade do |t|
    t.integer  "rest"
    t.integer  "repetitions"
    t.integer  "sets"
    t.integer  "training_day_id"
    t.integer  "exercise_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "training_day_exercises", ["exercise_id"], name: "index_training_day_exercises_on_exercise_id"
  add_index "training_day_exercises", ["training_day_id"], name: "index_training_day_exercises_on_training_day_id"

  create_table "training_days", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "training_programs", force: :cascade do |t|
    t.string   "name"
    t.integer  "program_type_id"
    t.text     "description"
    t.integer  "body_type"
    t.integer  "male_type"
    t.integer  "first_day_id"
    t.integer  "second_day_id"
    t.integer  "third_day_id"
    t.integer  "fourth_day_id"
    t.integer  "fifth_day_id"
    t.integer  "sixth_day_id"
    t.integer  "seventh_day_id"
    t.integer  "template_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "program_image_file_name"
    t.string   "program_image_content_type"
    t.integer  "program_image_file_size"
    t.datetime "program_image_updated_at"
  end

  add_index "training_programs", ["fifth_day_id"], name: "index_training_programs_on_fifth_day_id"
  add_index "training_programs", ["first_day_id"], name: "index_training_programs_on_first_day_id"
  add_index "training_programs", ["fourth_day_id"], name: "index_training_programs_on_fourth_day_id"
  add_index "training_programs", ["program_type_id"], name: "index_training_programs_on_program_type_id"
  add_index "training_programs", ["second_day_id"], name: "index_training_programs_on_second_day_id"
  add_index "training_programs", ["seventh_day_id"], name: "index_training_programs_on_seventh_day_id"
  add_index "training_programs", ["sixth_day_id"], name: "index_training_programs_on_sixth_day_id"
  add_index "training_programs", ["template_id"], name: "index_training_programs_on_template_id"
  add_index "training_programs", ["third_day_id"], name: "index_training_programs_on_third_day_id"
  add_index "training_programs", ["user_id"], name: "index_training_programs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "roles_mask"
    t.string   "slug"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

end
