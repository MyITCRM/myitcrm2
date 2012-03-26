class CreatePermittables < ActiveRecord::Migration
  def change
    create_table :permittables, :id => false do |t|
      t.integer :role_id
      t.integer :permission_id
    end
  end
end
