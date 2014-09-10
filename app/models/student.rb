class Student < ActiveRecord::Base
  validates_presence_of :name, :psi, :first, :last, :dob
  validates_uniqueness_of :psi
end
