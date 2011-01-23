class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user

# Validate Input information
#  validates_presence_of :subject, :description,  :on => :create



  def before_create
    self.created_at ||= Time.now
    self.status_id ||= 1
    self.assigned_to_username ||= nil
    self.closed ||= 0
  end
  def before_update
    self.updated_at ||= Time.now
  end

end
