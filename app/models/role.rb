class Role < ActiveRecord::Base
	has_many :users
	has_many :permittables
	has_many :permissions, :through => :permittables

  validates_presence_of :name, :list_position

  validates_uniqueness_of :name

  attr_accessible :name, :list_position, :enabled, :permission_ids

end
