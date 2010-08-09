class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
        t.string :business_name
        t.string :business_number
        t.string :business_slogan
        t.text :address
        t.string :city
        t.string :state
        t.string :zip
        t.string :phone
        t.string :fax
        t.string :email
        t.text :billing_address
        t.string :billing_city
        t.string :billing_state
        t.string :billing_zip
        t.string :billing_phone
        t.string :billing_fax
        t.string :billing_email
        t.string :default_credit_terms
        t.integer :default_credit_amount
        t.string :business_contact_name
        t.string :business_contact_phone
        t.string :business_contact_email
        t.string :default_from_email
        t.string :default_no_reply_email
        t.text :terms_and_conditions
        t.text :privacy_policy
        t.text :invoice_message
        t.boolean :enable_textarea_html_editor
        t.boolean :enable_google_calendar
        t.boolean :enable_google_maps
        t.boolean :enable_paymate
        t.boolean :enable_voucher
        t.integer :default_voucher_valid_days
        t.string :paymate_username
        t.string :paymate_password
        t.integer :paymate_transaction_fee
        t.boolean :enable_paypal
        t.string :paypal_username
        t.integer :paypal_transaction_fee
        t.boolean :enable_credit_card
        t.boolean :enable_direct_deposit
        t.string :direct_deposit_bank_number
        t.string :direct_deposit_bank_name
        t.integer :direct_deposit_bank_account
        t.string :direct_deposit_bank_account_name
        t.string :direct_deposit_instructions
        t.boolean :enable_cheque
        t.string :cheque_payable_to
        t.integer :default_tax
        t.integer :default_tax_name
        t.boolean :business_open_sunday
        t.boolean :business_open_monday
        t.boolean :business_open_tuesday
        t.boolean :business_open_wednesday
        t.boolean :business_open_thursday
        t.boolean :business_open_friday
        t.boolean :business_open_saturday
        t.string :business_open_sunday_from
        t.string :business_open_sunday_to
        t.boolean :business_open_monday
        t.string :business_open_monday_from
        t.string :business_open_monday_to
        t.boolean :business_open_tuesday
        t.string :business_open_tuesday_from
        t.string :business_open_tuesday_to
        t.boolean :business_open_wednesday
        t.string :business_open_wednesday_from
        t.string :business_open_wednesday_to
        t.boolean :business_open_thursday
        t.string :business_open_thursday_from
        t.string :business_open_thursday_to
        t.boolean :business_open_friday
        t.string :business_open_friday_from
        t.string :business_open_friday_to
        t.boolean :business_open_saturday
        t.string :business_open_saturday_from
        t.string :business_open_saturday_to



      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
