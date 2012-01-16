class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user
  has_many :replies, :dependent => :destroy

# Validate Input information
  validates_presence_of :subject, :description, :user_id

  attr_accessible :description, :subject, :priority_list_id, :edited_by, :updated_at, :assigned_to_username, :user_id, :created_by, :status_id, :resolution, :closed_by, :closed_date, :closed
  before_create :workorder_created
  before_update :workorder_updated, :change_assignment, :lookup_assigned_username, :change_status
  #before_save  : :change_assignment


  def workorder_created
    self.created_at ||= Time.now
    self.status_id ||= 1
    self.closed ||= -1

  end

  def workorder_updated
    self.updated_at ||= Time.now
    if self.closed == 1
      self.status_id = 4
      self.closed_by = edited_by
    end
    if self.status_id == 1
      self.assigned_to_id ||= nil
      self.assigned_to_username ||= nil
    end
  end

# Used to obtain the Assigned Users name from the database on Work Order saving,
# instead of making a separate call each time it's displayed in the table
  def lookup_assigned_username
    if self.assigned_to_username.blank?
        self.assigned_to_id = nil
      else
        assigned_user = User.where(["name = ?", assigned_to_username]).first
        self.assigned_to_id = assigned_user.id

      end
  end

  def change_assignment
    #  This will change the status from NEW to Assigned when a user is assigned to a NEW Work Order
    if self.assigned_to_username.blank? then
#     If there is no assigned user, it will change the status back to NEW
      new_wo_status = "1"
      self.status_id = new_wo_status
    else
      if self.status_id == 1 then
        new_wo_status = "2"
        self.status_id = new_wo_status
      end
    end
  end

    def change_status
      if self.closed.present?
        self.status_id=6
      end
    end
  #
  #def reply
  #    @reply
  #  end
  #def reply_attributes=(attributes)
  #
  #end

end

