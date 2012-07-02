class Role < ActiveRecord::Base
	has_many :users
	has_many :permittables
	has_many :permissions, :through => :permittables

  validates_uniqueness_of :name

end
