class Person < ActiveRecord::Base
  has_many :grades
  has_many :sessions, :through => :grades

  has_many :logs
  has_many :states, :through => :logs
end
