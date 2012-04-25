class Permission < ActiveRecord::Base
	has_many :permittables
	has_many :roles, :through => :permittables

  attr_accessible :name, :action, :subject_class, :subject_id
end
