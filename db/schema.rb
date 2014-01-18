<<<<<<< HEAD
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

ActiveRecord::Schema.define(version: 20140106170415) do

  create_table "posts", force: true do |t|
    t.string  "title"
    t.text    "text"
    t.time    "time"
    t.integer "user_id"
    t.integer "topic_id"
  end

  create_table "projections", force: true do |t|
    t.string  "class_name"
    t.integer "last_id"
    t.boolean "solid"
  end

  add_index "projections", ["class_name"], name: "index_projections_on_class_name"

  create_table "topics", force: true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "Vorname"
    t.string "Name"
    t.string "EMail"
    t.string "Benutzername"
    t.string "Passwort"
  end

end
=======
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

ActiveRecord::Schema.define(version: 20140114132930) do

  create_table "lastposts", force: true do |t|
    t.string  "title"
    t.text    "text"
    t.time    "time"
    t.integer "user_id_id"
    t.integer "topic_id"
  end

  add_index "lastposts", ["topic_id"], name: "index_lastposts_on_topic_id"
  add_index "lastposts", ["user_id_id"], name: "index_lastposts_on_user_id_id"

  create_table "posts", force: true do |t|
    t.string  "title"
    t.text    "text"
    t.time    "time"
    t.integer "user_id_id"
    t.integer "topic_id"
  end

  create_table "projections", force: true do |t|
    t.string  "class_name"
    t.integer "last_id"
    t.boolean "solid"
  end

  add_index "projections", ["class_name"], name: "index_projections_on_class_name"

  create_table "topics", force: true do |t|
    t.string   "thema"
    t.integer  "startedby"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "Vorname"
    t.string "Name"
    t.string "Email"
    t.string "Benutzername"
    t.string "Passwort"
  end

end
>>>>>>> f12961e6b352b1b818c596b92048aa786898bed4
