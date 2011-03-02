class Assignment < ActiveRecord::Base
  has_many :roles
  has_many :permissions
end
