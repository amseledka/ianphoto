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

ActiveRecord::Schema.define(:version => 20110929220916) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "user_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "promote_to_front_page", :default => true
    t.string   "vertical_alignment"
  end

  create_table "regestration_keys", :force => true do |t|
    t.string   "registration_key"
    t.boolean  "used",             :default => false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "static_pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "price"
    t.string   "city"
    t.string   "phone"
    t.string   "skype"
    t.string   "registration_key"
    t.integer  "registration_key_id"
  end

end
