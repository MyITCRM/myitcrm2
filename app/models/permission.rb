class Permission < ActiveRecord::Base
	has_many :permittables
	has_many :roles, :through => :permittables

  validates_uniqueness_of :name

end
