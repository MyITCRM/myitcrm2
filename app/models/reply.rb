class Reply < ActiveRecord::Base
  belongs_to :work_order, :touch => true # With :touch => true set, when a reply is updated or created will also update the updated_at timestamp on the Work Order.
  belongs_to :user

  attr_accessible :content, :work_order_id, :user_id

	validates_presence_of :content, :work_order_id, :user_id

end
