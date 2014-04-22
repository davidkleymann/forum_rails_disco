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

ActiveRecord::Schema.define(version: 20140217163904) do

  create_table "domain_events", force: true do |t|
    t.string   "event"
    t.text     "data"
    t.datetime "created_at"
  end

  create_table "posts", force: true do |t|
    t.string "title"
    t.text   "text"
  end

  create_table "unique_command_ids", force: true do |t|
    t.string  "command"
    t.integer "last_id"
  end

  add_index "unique_command_ids", ["command"], name: "index_unique_command_ids_on_command", unique: true

  create_table "users", force: true do |t|
    t.string "benutzername"
    t.string "password_digest"
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

ActiveRecord::Schema.define(version: 20140217163904) do

  create_table "domain_events", force: true do |t|
    t.string   "event"
    t.text     "data"
    t.datetime "created_at"
  end

  create_table "posts", force: true do |t|
    t.string "title"
    t.text   "text"
  end

  create_table "unique_command_ids", force: true do |t|
    t.string  "command"
    t.integer "last_id", default: 0
  end

  add_index "unique_command_ids", ["command"], name: "index_unique_command_ids_on_command", unique: true

  create_table "users", force: true do |t|
    t.string "benutzername"
    t.string "password_digest"
  end

end
>>>>>>> b5e021d00b766777edca0e3ded8b94e915485c2e
