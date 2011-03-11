class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user

# Validate Input information
  validates_presence_of :subject, :description, :user_id,  :on => :create



  def before_create
    self.created_at ||= Time.now
    self.status_id ||= 1
    self.assigned_to_username ||= nil
    self.closed ||= false
  end
  def before_update
    self.updated_at ||= Time.now
#    if closed == true then
#      self.status_id ||= 4
#      self.closed_by ||= edited_by
#    end
  end

end
