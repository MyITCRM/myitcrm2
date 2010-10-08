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

ActiveRecord::Schema.define(:version => 20100906074944) do

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
    t.string   "product_category_id", :limit => 0
    t.integer  "child_category_id"
    t.string   "warranty_info"
    t.string   "warranty_length"
    t.string   "warranty_unit"
    t.boolean  "taxable"
    t.decimal  "tax_rate",                         :default => 0.0, :null => false
    t.decimal  "cost_price",                       :default => 0.0, :null => false
    t.decimal  "sell_price",                       :default => 0.0, :null => false
    t.decimal  "mark_up",                          :default => 0.0, :null => false
    t.boolean  "active"
    t.decimal  "weight",                           :default => 0.0, :null => false
    t.boolean  "discountable"
    t.decimal  "disc_percent",                     :default => 0.0, :null => false
    t.decimal  "disc_amount",                      :default => 0.0, :null => false
    t.string   "created_by"
    t.string   "edited_by"
    t.datetime "edited_at"
    t.decimal  "qty_on_hand",                      :default => 0.0, :null => false
    t.decimal  "qty_allocated",                    :default => 0.0, :null => false
    t.decimal  "qty_available",                    :default => 0.0, :null => false
    t.decimal  "qty_ordered",                      :default => 0.0, :null => false
    t.decimal  "stocking_qty",                     :default => 0.0, :null => false
    t.boolean  "stocked_product"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "business_name"
    t.string   "business_number"
    t.string   "business_slogan"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "billing_address"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_zip"
    t.string   "billing_phone"
    t.string   "billing_fax"
    t.string   "billing_email"
    t.string   "default_credit_terms"
    t.integer  "default_credit_amount"
    t.string   "business_contact_name"
    t.string   "business_contact_phone"
    t.string   "business_contact_email"
    t.string   "default_from_email"
    t.string   "default_no_reply_email"
    t.string   "language"
    t.text     "terms_and_conditions"
    t.text     "privacy_policy"
    t.text     "invoice_message"
    t.boolean  "enable_textarea_html_editor"
    t.boolean  "enable_google_calendar"
    t.boolean  "enable_google_maps"
    t.boolean  "enable_paymate"
    t.boolean  "enable_cash"
    t.boolean  "enable_voucher"
    t.integer  "default_voucher_valid_days"
    t.string   "paymate_username"
    t.string   "paymate_password"
    t.decimal  "paymate_transaction_fee",          :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.boolean  "enable_paypal"
    t.string   "paypal_username"
    t.decimal  "paypal_transaction_fee",           :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.boolean  "enable_credit_card"
    t.boolean  "enable_direct_deposit"
    t.string   "direct_deposit_bank_number"
    t.string   "direct_deposit_bank_name"
    t.integer  "direct_deposit_bank_account"
    t.string   "direct_deposit_bank_account_name"
    t.string   "direct_deposit_instructions"
    t.boolean  "enable_cheque"
    t.string   "cheque_payable_to"
    t.boolean  "enable_tax"
    t.decimal  "default_tax",                      :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "default_tax_name"
    t.boolean  "business_open_sunday"
    t.boolean  "business_open_monday"
    t.boolean  "business_open_tuesday"
    t.boolean  "business_open_wednesday"
    t.boolean  "business_open_thursday"
    t.boolean  "business_open_friday"
    t.boolean  "business_open_saturday"
    t.string   "business_open_sunday_from"
    t.string   "business_open_sunday_to"
    t.string   "business_open_monday_from"
    t.string   "business_open_monday_to"
    t.string   "business_open_tuesday_from"
    t.string   "business_open_tuesday_to"
    t.string   "business_open_wednesday_from"
    t.string   "business_open_wednesday_to"
    t.string   "business_open_thursday_from"
    t.string   "business_open_thursday_to"
    t.string   "business_open_friday_from"
    t.string   "business_open_friday_to"
    t.string   "business_open_saturday_from"
    t.string   "business_open_saturday_to"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "work_orders", :force => true do |t|
    t.string   "subject"
    t.text     "description"
    t.integer  "note_id"
    t.integer  "comment_id"
    t.integer  "attachment_id"
    t.integer  "schedule_id"
    t.boolean  "closed"
    t.integer  "closed_by"
    t.datetime "closed_date"
    t.text     "resolution"
    t.integer  "user_id"
    t.integer  "assigned_to"
    t.integer  "priority_list_id"
    t.integer  "status_id"
    t.integer  "created_by"
    t.integer  "edited_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
