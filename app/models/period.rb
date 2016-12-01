class Period < ActiveRecord::Base
  has_many :grades
  has_many :persons, :through => :grades
end
