class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :psi
      t.string :first
      t.string :mi
      t.string :last
      t.string :suffix
      t.date :dob
    end
  end
end
