class Permission < ActiveRecord::Base
  belongs_to :role
  has_many :users, :through => :roles
end
