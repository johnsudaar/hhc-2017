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

ActiveRecord::Schema.define(version: 20170318124731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string   "title"
    t.string   "icon"
    t.integer  "annual_threshold"
    t.integer  "global_threshold"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "badges_users", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "user_id"
    t.index ["badge_id"], name: "index_badges_users_on_badge_id", using: :btree
    t.index ["user_id"], name: "index_badges_users_on_user_id", using: :btree
  end

  create_table "blood_types", force: :cascade do |t|
    t.string   "rhesus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bloodtypes_entities", id: false, force: :cascade do |t|
    t.integer "entity_id",    null: false
    t.integer "bloodtype_id", null: false
    t.integer "quantite"
  end

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "street"
    t.string   "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "blood_type_id"
    t.date     "last_gift_date"
    t.index ["blood_type_id"], name: "index_users_on_blood_type_id", using: :btree
  end

  add_foreign_key "users", "blood_types"
end
