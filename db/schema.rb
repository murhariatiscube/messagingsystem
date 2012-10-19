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

ActiveRecord::Schema.define(:version => 20120814204539) do

  create_table "message_templates", :force => true do |t|
    t.string   "name",         :limit => 25
    t.text     "data"
    t.date     "active_form"
    t.date     "active_until"
    t.integer  "status",       :limit => 1
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "message_template_id"
    t.integer  "response"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "messages", ["user_id", "message_template_id"], :name => "index_messages_on_user_id_and_message_template_id"

  create_table "users", :force => true do |t|
    t.string   "name",               :limit => 25
    t.string   "nickname",           :limit => 50
    t.string   "email",                            :default => "", :null => false
    t.string   "hashed_password",    :limit => 50
    t.string   "confirmed_password"
    t.string   "salt"
    t.string   "external_ref",       :limit => 60
    t.integer  "status",             :limit => 1
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

end
