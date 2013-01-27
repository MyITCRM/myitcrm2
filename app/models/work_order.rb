class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  belongs_to :user
  has_many :replies, :dependent => :destroy  # Destroy's the associated replies if a Work Order is deleted
  has_many :tasks, :dependent => :destroy  # Destroy's the associated tasks if a Work Order is deleted

# Validate presence of Input information when creating or editing
  validates_presence_of :subject, :description

  attr_accessible :description, :subject, :priority_list_id, :edited_by, :created_by, :user_id, :task_id

  before_update :workorder_updated, :change_assignment, :lookup_assigned_username, :change_status



     def workorder_updated
      if self.closed == 1
        self.status_id = 4
        self.closed_by = edited_by
      end
      # When updating occurs, lets check to see if the status
      # has changed to new and if so lets remove the assigned user details
      if self.status_id == 1
        self.assigned_to_id ||= nil
        self.assigned_to_username ||= nil
      end
    end

  def change_assignment
      #  This will change the status from NEW to Assigned when a user is assigned to a NEW Work Order
      if self.assigned_to_username.blank?
        #     If there is no assigned user, it will change the status back to NEW
        new_wo_status = "1"
        self.status_id = new_wo_status
      else
        if self.status_id == 1
          new_wo_status = "2"
          self.status_id = new_wo_status
        end
      end
    end
      # On Update if the closed value is true then we assign it the closed status and
      # add the time as to when it was closed.
      def change_status
        if self.closed.present?
          self.status_id=6
          self.closed_date=Time.now
        end
      end

  private
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

end

