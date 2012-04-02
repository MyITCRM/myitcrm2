class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :action
      t.string :subject_class
      t.string :subject_id
    end
  end
end
