class Position < ActiveRecord::Base
  has_many :users
  belongs_to :role
end
