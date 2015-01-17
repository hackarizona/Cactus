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

ActiveRecord::Schema.define(version: 20150117215703) do

  create_table "dashboards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forms", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "project"
    t.boolean  "first_hackathon"
    t.text     "why"
    t.string   "how_did_you_hear_about_us"
    t.string   "proficiencies"
    t.text     "sponsor_you_want_to_see"
    t.text     "what_do_you_want_to_learn"
    t.string   "shirt_size"
    t.text     "dietary_restrictions"
    t.boolean  "code_of_conduct_read"
    t.integer  "team_id"
    t.string   "interests"
    t.integer  "status",                    default: 0
    t.integer  "user_id"
  end

  create_table "notifications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teammates"
  end

  create_table "universities", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country_code"
    t.string   "name"
    t.string   "domain"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "age"
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "school"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "github"
    t.string   "resume"
    t.string   "website"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
