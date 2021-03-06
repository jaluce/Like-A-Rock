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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130410032017) do

  create_table "admins", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "albums", :force => true do |t|
    t.string   "url"
    t.string   "sol"
    t.string   "timestamp"
    t.integer  "num_images"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "earthday"
  end

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "image_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["image_id"], :name => "index_comments_on_image_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "urlList"
    t.string   "sol"
    t.integer  "album_id"
    t.integer  "votes_count",              :default => 0
    t.integer  "responses_count",          :default => 0
    t.string   "bucket"
    t.string   "cameraModelComponentList"
    t.string   "dateAdded"
    t.string   "filterName"
    t.string   "pdsLabelUrl"
    t.string   "scaleFactor"
    t.string   "sclk"
    t.string   "attitude"
    t.string   "cameraPosition"
    t.string   "contributor"
    t.string   "drive"
    t.string   "cameraModelType"
    t.string   "mastAz"
    t.string   "site"
    t.string   "cameraVector"
    t.string   "itemName"
    t.string   "subframeRect"
    t.string   "utc"
    t.string   "mastEl"
    t.string   "instrument"
    t.string   "lmst"
    t.string   "sampleType"
    t.string   "xyz"
    t.datetime "responded_at",             :default => '2013-04-19 19:48:21'
    t.datetime "commented_at",             :default => '2013-04-19 19:48:21'
    t.datetime "created_at",                                                  :null => false
    t.datetime "updated_at",                                                  :null => false
  end

  add_index "images", ["album_id"], :name => "index_images_on_album_id"

  create_table "responses", :force => true do |t|
    t.text     "body"
    t.text     "url"
    t.integer  "admin_id"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "responses", ["admin_id"], :name => "index_responses_on_admin_id"
  add_index "responses", ["image_id"], :name => "index_responses_on_image_id"

  create_table "tags", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "image_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["image_id"], :name => "index_tags_on_image_id"
  add_index "tags", ["user_id"], :name => "index_tags_on_user_id"

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.boolean  "complete"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["image_id"], :name => "index_votes_on_image_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
