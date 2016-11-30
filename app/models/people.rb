class People < ActiveRecord::Base
 # attr_accessible :name, :sex, :age, :id_card, :role, :phone, :email, :person_number, :state_id

  has_many :grades
  has_many :sessions, :through => :grades

  has_many :logs
  has_many :states, :through => :logs
end
