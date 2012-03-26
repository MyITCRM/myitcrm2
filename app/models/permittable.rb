class Permittable < ActiveRecord::Base
	belongs_to :role
	belongs_to :permission
end
