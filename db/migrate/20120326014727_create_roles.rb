class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.boolean :enabled
      t.integer :list_position

      t.timestamps
    end

end
end
