class Supplier < ActiveRecord::Base
  def before_create
self.date_created ||= Time.now
self.active ||= "1"
end
def before_update
self.date_updated = Time.now
end
  def before_edit
  self.date_updated = Time.now
  end
  
end
