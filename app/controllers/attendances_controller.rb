class AttendancesController < ApplicationController
  def new
    @student = Student.find_by(id: params[:attendance][:student])
  end

  def create
    @student = Student.find_by(id: params[:student_id])
    Attendance.create(student: @student)
    redirect_to root_path
  end
end
