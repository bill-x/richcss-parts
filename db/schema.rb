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

ActiveRecord::Schema.define(version: 20150721175333) do

  create_table "contributors", force: true do |t|
    t.string   "part_name"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", force: true do |t|
    t.string   "part_name"
    t.string   "part_version"
    t.string   "dependency_name"
    t.string   "dependency_version"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.string   "name"
    t.string   "current_version"
    t.string   "description"
    t.integer  "total_downloads", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "github_link"
    t.string   "author_name"
    t.string   "author_email"
  end

  create_table "versions", force: true do |t|
    t.string   "part_name"
    t.string   "version"
    t.integer  "number_of_downloads", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "release_number"
  end

end
