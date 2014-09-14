require 'csv'

class Student < ActiveRecord::Base
  validates_presence_of :name, :psi, :first, :last, :dob
  validates_uniqueness_of :psi

  def self.import file
    CSV.foreach(file, {headers: true}) do |row|
      r = Integer(row[0]) rescue nil
      break if r.is_a? Numeric
      date = Date.strptime(row['DOB'], '%m/%d/%Y')
      s = Student.create(name: row['Name'], psi: row['PSI'],
        first: row['First'], mi: row['MI'], last: row['Last'],
        suffix: row['Suffix'], dob: date)
    end
  end
end
