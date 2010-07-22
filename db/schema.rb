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

ActiveRecord::Schema.define(:version => 20100722015750) do

  create_table "parts", :force => true do |t|
    t.integer  "supplier_id"
    t.string   "supplier_sku"
    t.string   "our_sku"
    t.string   "manufacturer"
    t.string   "description"
    t.string   "model"
    t.integer  "parent_category_id"
    t.integer  "child_category_id"
    t.string   "warranty_info"
    t.string   "warranty_length"
    t.string   "warranty_unit"
    t.boolean  "taxable"
    t.integer  "tax_rate",           :precision => 10, :scale => 0
    t.integer  "cost_price",         :precision => 10, :scale => 0
    t.integer  "sell_price",         :precision => 10, :scale => 0
    t.integer  "mark_up",            :precision => 10, :scale => 0
    t.boolean  "active"
    t.integer  "weight",             :precision => 10, :scale => 0
    t.boolean  "discountable"
    t.integer  "disc_percent",       :precision => 10, :scale => 0
    t.integer  "disc_amount",        :precision => 10, :scale => 0
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "edited_at"
    t.integer  "qty_on_hand"
    t.integer  "qty_allocated"
    t.integer  "qty_available"
    t.integer  "qty_ordered"
    t.integer  "stocking_qty"
    t.boolean  "stocked_product"
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
    t.string   "role"
    t.integer  "roles_mask"
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

end
