class PageCategory < ActiveRecord::Base
  has_many :pages
  validates_presence_of :name
  validates_uniqueness_of :name
end
