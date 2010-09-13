class WorkOrder < ActiveRecord::Base
  belongs_to :priority_list
  belongs_to :status
  has_many :users

  def before_create
    self.created_at ||= Time.now
  end
  def before_update
    self.updated_at ||= Time.now
  end
end
