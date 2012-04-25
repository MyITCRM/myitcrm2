class Permittable < ActiveRecord::Base
	belongs_to :role
	belongs_to :permission

  attr_accessible :role_id, :permission_id  # mytodo Check Mass Assignment
end
