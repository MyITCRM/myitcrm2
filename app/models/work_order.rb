class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user


  def before_create
    self.created_at ||= Time.now
    self.status_id ||= 1
  end
  def before_update
    self.updated_at ||= Time.now
  end

end
