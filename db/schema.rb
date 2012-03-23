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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120302185841) do

  create_table "gunpics", :force => true do |t|
    t.string   "weapon_photo"
    t.string   "photo_name"
    t.integer  "weapon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gunpics", ["weapon_id"], :name => "index_gunpics_on_weapon_id"

  create_table "user_weapons", :force => true do |t|
    t.integer  "user_id"
    t.integer  "weapon_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_weapons", ["user_id"], :name => "index_user_weapons_on_user_id"
  add_index "user_weapons", ["weapon_id"], :name => "index_user_weapons_on_weapon_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "weapon_types", :force => true do |t|
    t.string   "type_name"
    t.string   "type_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapons", :force => true do |t|
    t.string   "weapon_name"
    t.string   "weapon_nickname"
    t.string   "weapon_action"
    t.string   "weapon_image"
    t.string   "caliber"
    t.string   "caliber_unit"
    t.integer  "round_cap"
    t.integer  "rate_of_fire"
    t.string   "rof_unit"
    t.integer  "max_range"
    t.string   "max_range_unit"
    t.integer  "effective_range"
    t.string   "effective_range_unit"
    t.string   "origin_country"
    t.integer  "year_made"
    t.boolean  "weapon_approval",      :default => false
    t.boolean  "submit_name",          :default => false
    t.integer  "weapon_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weapons", ["weapon_type_id"], :name => "index_weapons_on_weapon_type_id"

end
