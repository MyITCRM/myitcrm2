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

ActiveRecord::Schema.define(:version => 20110302062224) do

  create_table "assignments", :force => true do |t|
    t.integer "role_id"
    t.integer "permission_id"
  end

  create_table "permissions", :force => true do |t|
    t.string   "action"
    t.string   "subject_class"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  create_table "priority_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", :force => true do |t|
    t.string   "name"
    t.integer  "sub_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.integer  "supplier_id"
    t.string   "supplier_sku"
    t.string   "our_sku"
    t.string   "manufacturer"
    t.string   "description"
    t.string   "model"
    t.string   "product_category_id"
    t.integer  "child_category_id"
    t.string   "warranty_info"
    t.string   "warranty_length"
    t.string   "warranty_unit"
    t.boolean  "taxable"
    t.decimal  "tax_rate",            :default => 0.0, :null => false
    t.decimal  "cost_price",          :default => 0.0, :null => false
    t.decimal  "sell_price",          :default => 0.0, :null => false
    t.decimal  "mark_up",             :default => 0.0, :null => false
    t.boolean  "active"
    t.decimal  "weight",              :default => 0.0, :null => false
    t.boolean  "discountable"
    t.decimal  "disc_percent",        :default => 0.0, :null => false
    t.decimal  "disc_amount",         :default => 0.0, :null => false
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "edited_at"
    t.decimal  "qty_on_hand",         :default => 0.0, :null => false
    t.decimal  "qty_allocated",       :default => 0.0, :null => false
    t.decimal  "qty_available",       :default => 0.0, :null => false
    t.decimal  "qty_ordered",         :default => 0.0, :null => false
    t.decimal  "stocking_qty",        :default => 0.0, :null => false
    t.boolean  "stocked_product"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string "name",  :limit => 30, :default => "", :null => false
    t.text   "value"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "company_name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.string   "credit_terms"
    t.integer  "credit_amount"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.text     "notes"
    t.boolean  "active"
    t.datetime "date_created"
    t.datetime "date_updated"
    t.integer  "parts_leadtime_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "edited_at"
    t.string   "website"
  end

  create_table "user_sessions", :force => true do |t|
    t.string "username"
    t.string "password"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "role_id"
    t.integer  "login_count",        :default => 0,    :null => false
    t.integer  "failed_login_count", :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.text     "notes"
    t.boolean  "active",             :default => true
    t.datetime "edited_at"
    t.string   "edited_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "created_by"
  end

  create_table "work_orders", :force => true do |t|
    t.string   "subject"
    t.text     "description"
    t.integer  "note_id"
    t.integer  "comment_id"
    t.integer  "attachments_id"
    t.integer  "schedules_id"
    t.boolean  "closed"
    t.string   "closed_by"
    t.datetime "closed_date"
    t.text     "resolution"
    t.integer  "user_id"
    t.integer  "assigned_to_id"
    t.text     "assigned_to_username"
    t.integer  "priority_list_id"
    t.integer  "status_id"
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
