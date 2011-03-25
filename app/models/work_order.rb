class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user

# Validate Input information
#  validates_presence_of :subject, :description, :user_id,  :on => :create

  before_create :workorder_created
  before_update :workorder_updated
  before_save :lookup_assigned_username


  def workorder_created
    self.created_at ||= Time.now
    self.status_id ||= 1
    self.assigned_to_username ||= nil
    self.closed ||= 0
  end
  def workorder_updated
    self.updated_at ||= Time.now
    if self.closed == 1 then
      self.status_id ||= 4
      self.closed_by ||= edited_by
    end
   if self.status_id == 1 then
     self.assigned_to_id ||= nil
     self.assigned_to_username ||= nil
   end
  end
# Used to obtain the Assigned Users name from the database on Work Order saving, instead of making a separate call each time it's displayed in the table
  def lookup_assigned_username
    assigned_user = User.where(["name = ?", assigned_to_username]).first
  self.assigned_to_id = assigned_user.id
  end


end
