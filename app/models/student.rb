require 'csv'

class Student < ActiveRecord::Base
  has_many :attendances

  validates_presence_of :name, :psi, :first, :last, :dob
  validates_uniqueness_of :psi

  def self.import file
    CSV.foreach(file, {headers: true}) do |row|
      r = Integer(row[0]) rescue nil
      break if r.is_a? Numeric

      date = Date.strptime(row['DOB'], '%m/%d/%Y')
      row_hash = {name: row['Name'], psi: row['PSI'],
        first: row['First'], mi: row['MI'], last: row['Last'],
        suffix: row['Suffix'], dob: date}

      if s = Student.find_by(psi: row['PSI'])
        s.update(row_hash)
      else
        Student.create(row_hash)
      end
    end
  end
end
