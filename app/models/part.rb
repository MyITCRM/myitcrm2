class Part < ActiveRecord::Base
  belongs_to :supplier

 def before_create
   self.active = 1
   self.created_at = Time.now
   
 end

end
