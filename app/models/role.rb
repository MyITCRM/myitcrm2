class Role < ActiveRecord::Base
	has_many :users
	has_many :permittables
	has_many :permissions, :through => :permittables

  #attr_accessible :name, :enabled, :list_position, :permittable_id

end
