
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  has_many :grades
  has_many :periods, :through => :grades

  has_many :logs
  has_many :states, :through => :logs
end
