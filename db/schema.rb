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

ActiveRecord::Schema.define(version: 20140424141653) do

  create_table "admin_messages", force: true do |t|
    t.text    "message"
    t.integer "user_id"
  end

  create_table "last_posts", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "latest_topics", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "thema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "benutzername"
    t.integer  "user_id"
    t.integer  "topic_id"
    t.string   "gravatar_id"
  end

  create_table "projections", force: true do |t|
    t.string  "class_name"
    t.integer "last_id",    default: 0
    t.boolean "solid",      default: true
  end

  add_index "projections", ["class_name"], name: "index_projections_on_class_name"

  create_table "subscribedposts", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "benutzername"
    t.string   "gravatar_id"
    t.integer  "subscription_id"
    t.boolean  "updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribedposts", ["subscription_id"], name: "index_subscribedposts_on_subscription_id"

  create_table "subscriptions", force: true do |t|
    t.integer "user_id"
    t.boolean "email"
    t.integer "topic_id"
    t.string  "topic_name"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "themas", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "lastpost_time"
    t.string   "lastpost_user"
    t.integer  "belong"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.string   "benutzername"
    t.integer  "user_id"
    t.integer  "thema_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gravatar_id"
    t.integer  "count",        default: 0
    t.integer  "count24",      default: 0
  end

  create_table "users", force: true do |t|
    t.string  "vorname"
    t.string  "name"
    t.string  "email"
    t.string  "benutzername"
    t.integer "typ"
    t.boolean "verificated"
    t.boolean "ban"
    t.integer "rate"
    t.string  "shash"
  end

end
