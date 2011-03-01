class Role < ActiveRecord::Base
  belongs_to :user
  has_many :permissions
end
