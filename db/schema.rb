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

ActiveRecord::Schema.define(version: 20140707111715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
  create_table "accounts", force: true do |t|
    t.string   "email"
    t.text     "password_digest"
    t.text     "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
  create_table "students", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthday"
    t.text     "address"
    t.string   "studentid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
    
  add_index "comments", ["student_id"], name: "index_comments_on_student_id"
    
  create_table "comments", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.string   "userid"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
