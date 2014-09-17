class CreateAttendance < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :student, index: true
      t.boolean :snack, default: false
    end
  end
end
