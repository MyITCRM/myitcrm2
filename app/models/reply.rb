class Reply < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :user

  attr_accessible :private, :content, :work_order_id, :user_id
end
