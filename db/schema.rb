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

ActiveRecord::Schema.define(version: 20140514145413) do

  create_table "comics", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "not_found_regex"
  end

  create_table "strips", force: true do |t|
    t.integer  "comic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
  end

  add_index "strips", ["comic_id"], name: "index_strips_on_comic_id"
  add_index "strips", ["number"], name: "index_strips_on_number"

  create_table "tag_types", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.integer  "votes"
    t.integer  "strip_id"
    t.integer  "tag_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["strip_id"], name: "index_tags_on_strip_id"
  add_index "tags", ["tag_type_id"], name: "index_tags_on_tag_type_id"

end
