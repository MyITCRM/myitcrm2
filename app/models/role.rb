class Role < ActiveRecord::Base
	has_many :permittables
	has_many :permissions, :through => :permittables

end
