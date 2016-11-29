class State < ActiveRecord::Base
  has_many :logs
  has_many :persons, :through => :logs
end
