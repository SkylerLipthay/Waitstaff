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

ActiveRecord::Schema.define(:version => 20130429060604) do

  create_table "categories", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "description"
    t.integer "user_id"
  end

  create_table "items", :force => true do |t|
    t.string  "name",                                                            :null => false
    t.string  "description"
    t.decimal "price",         :precision => 8, :scale => 2, :default => 0.0,    :null => false
    t.string  "order_options",                               :default => "both", :null => false
    t.integer "category_id"
    t.integer "user_id"
  end

  create_table "items_locations", :id => false, :force => true do |t|
    t.integer "location_id"
    t.integer "item_id"
  end

  create_table "items_option_groups", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "option_group_id"
  end

  create_table "locations", :force => true do |t|
    t.integer  "user_id",                                                                :null => false
    t.string   "address",                                                                :null => false
    t.string   "city",                                                                   :null => false
    t.string   "state",                                                                  :null => false
    t.string   "zip_code",                                                               :null => false
    t.string   "login",                                                                  :null => false
    t.string   "crypted_password",                                                       :null => false
    t.string   "password_salt",                                                          :null => false
    t.string   "persistence_token",                                                      :null => false
    t.string   "single_access_token",                                                    :null => false
    t.string   "perishable_token",                                                       :null => false
    t.integer  "login_count",                                       :default => 0,       :null => false
    t.integer  "failed_login_count",                                :default => 0,       :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                                                             :null => false
    t.datetime "updated_at",                                                             :null => false
    t.string   "phone"
    t.string   "website"
    t.decimal  "sales_tax",           :precision => 3, :scale => 3, :default => 0.0,     :null => false
    t.decimal  "minimum_total",       :precision => 8, :scale => 2, :default => 0.0,     :null => false
    t.decimal  "delivery_fee",        :precision => 8, :scale => 3, :default => 0.0,     :null => false
    t.string   "delivery_fee_type",                                 :default => "fixed", :null => false
    t.string   "order_options",                                     :default => "both",  :null => false
    t.decimal  "max_distance",        :precision => 8, :scale => 3, :default => 5.0,     :null => false
  end

  create_table "option_groups", :force => true do |t|
    t.string  "name",                         :null => false
    t.integer "max_selection", :default => 0
    t.integer "user_id"
  end

  create_table "options", :force => true do |t|
    t.string  "name",                                                           :null => false
    t.string  "description"
    t.decimal "extra",           :precision => 8, :scale => 2, :default => 0.0, :null => false
    t.integer "option_group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :null => false
    t.string   "business_name",                      :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
