class Part < ActiveRecord::Base
  

 def before_create
   self.active = 1
   self.created_at = Time.now
   
 end

end
