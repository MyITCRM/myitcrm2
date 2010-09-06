class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
end
