# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091216223536) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bdrb_job_queues", :force => true do |t|
    t.text     "args"
    t.string   "worker_name"
    t.string   "worker_method"
    t.string   "job_key"
    t.integer  "taken"
    t.integer  "finished"
    t.integer  "timeout"
    t.integer  "priority"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "archived_at"
    t.string   "tag"
    t.string   "submitter_info"
    t.string   "runner_info"
    t.string   "worker_key"
    t.datetime "scheduled_at"
  end

  create_table "index_page_views_on_created_at", :id => false, :force => true do |t|
    t.binary   "id",         :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.datetime "created_at",                                                                                               :null => false
  end

  add_index "index_page_views_on_created_at", ["id"], :name => "id", :unique => true

  create_table "index_page_views_on_default", :id => false, :force => true do |t|
    t.binary "id",      :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "default",               :default => "",                                                                 :null => false
  end

  add_index "index_page_views_on_default", ["id"], :name => "id", :unique => true

  create_table "index_page_views_on_extra", :id => false, :force => true do |t|
    t.binary "id",    :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "extra",               :default => "",                                                                 :null => false
  end

  add_index "index_page_views_on_extra", ["id"], :name => "id", :unique => true

  create_table "index_page_views_on_host", :id => false, :force => true do |t|
    t.binary "id",   :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "host",               :default => "",                                                                 :null => false
  end

  add_index "index_page_views_on_host", ["id"], :name => "id", :unique => true

  create_table "index_page_views_on_trackback_id", :id => false, :force => true do |t|
    t.binary "id",           :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "trackback_id",               :default => "",                                                                 :null => false
  end

  add_index "index_page_views_on_trackback_id", ["id"], :name => "id", :unique => true

  create_table "index_trackback_codes_on_name", :id => false, :force => true do |t|
    t.binary "id",   :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "name",               :default => "",                                                                 :null => false
  end

  add_index "index_trackback_codes_on_name", ["id"], :name => "id", :unique => true

  create_table "index_trackback_codes_on_percentage", :id => false, :force => true do |t|
    t.binary "id",         :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.float  "percentage",               :default => 0.0,                                                                :null => false
  end

  add_index "index_trackback_codes_on_percentage", ["id"], :name => "id", :unique => true

  create_table "index_trackback_codes_on_user_id", :id => false, :force => true do |t|
    t.binary  "id",      :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.integer "user_id",               :default => 0,                                                                  :null => false
  end

  add_index "index_trackback_codes_on_user_id", ["id"], :name => "id", :unique => true

  create_table "index_trackbacks_on_created_at", :id => false, :force => true do |t|
    t.binary   "id",         :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.datetime "created_at",                                                                                               :null => false
  end

  add_index "index_trackbacks_on_created_at", ["id"], :name => "id", :unique => true

  create_table "index_trackbacks_on_default", :id => false, :force => true do |t|
    t.binary "id",      :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "default",               :default => "",                                                                 :null => false
  end

  add_index "index_trackbacks_on_default", ["id"], :name => "id", :unique => true

  create_table "index_trackbacks_on_host", :id => false, :force => true do |t|
    t.binary "id",   :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "host",               :default => "",                                                                 :null => false
  end

  add_index "index_trackbacks_on_host", ["id"], :name => "id", :unique => true

  create_table "index_trackbacks_on_session_id", :id => false, :force => true do |t|
    t.binary "id",         :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "session_id",               :default => "",                                                                 :null => false
  end

  add_index "index_trackbacks_on_session_id", ["id"], :name => "id", :unique => true

  create_table "index_trackbacks_on_trackback_code_name", :id => false, :force => true do |t|
    t.binary "id",                  :limit => 16, :default => "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000", :null => false
    t.string "trackback_code_name",               :default => "",                                                                 :null => false
  end

  add_index "index_trackbacks_on_trackback_code_name", ["id"], :name => "id", :unique => true

  create_table "page_views", :primary_key => "added_id", :force => true do |t|
    t.binary   "id",         :limit => 16
    t.text     "attributes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payable_actions", :force => true do |t|
    t.string   "type"
    t.string   "state"
    t.integer  "user_id"
    t.string   "trackback_code_name"
    t.string   "trackback_id"
    t.string   "order_number"
    t.float    "order_amount"
    t.float    "payout"
    t.datetime "approved_at"
    t.integer  "approved_by"
    t.datetime "paid_at"
    t.datetime "paid_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackback_codes", :primary_key => "added_id", :force => true do |t|
    t.binary   "id",         :limit => 16
    t.text     "attributes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackbacks", :primary_key => "added_id", :force => true do |t|
    t.binary   "id",         :limit => 16
    t.text     "attributes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "type"
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.datetime "approved_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
