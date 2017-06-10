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

ActiveRecord::Schema.define(version: 20170609164955) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "hit"
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "island"
    t.string   "city"
    t.string   "street"
    t.string   "zip"
    t.string   "phone"
    t.float    "lat",        limit: 24
    t.float    "long",       limit: 24
    t.integer  "site_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "name"
    t.index ["site_id"], name: "index_locations_on_site_id", using: :btree
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "web"
    t.string   "title"
    t.text     "description", limit: 65535
    t.string   "kw"
    t.integer  "category_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "hit"
    t.boolean  "poi"
    t.string   "facebook"
    t.string   "instagram"
    t.string   "tweeter"
    t.index ["category_id"], name: "index_sites_on_category_id", using: :btree
    t.index ["description", "kw", "title"], name: "FullText", type: :fulltext
  end

  add_foreign_key "locations", "sites"
  add_foreign_key "sites", "categories"
end
