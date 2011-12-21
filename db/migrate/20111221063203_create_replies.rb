class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.integer :user_id
      t.integer :work_order_id
      t.text :content
      t.boolean :private

      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
