class Reply < ActiveRecord::Base
  belongs_to :work_order
  belongs_to :user
end
