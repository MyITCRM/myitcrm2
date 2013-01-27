class Task < ActiveRecord::Base
	belongs_to :work_order, :touch => true
	belongs_to :user
	attr_accessible :work_order_id, :title, :description, :user_id, :calendar_id, :completed
	validates_presence_of :work_order_id, :description, :title
end
