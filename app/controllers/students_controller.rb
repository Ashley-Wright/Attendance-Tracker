class StudentsController < ApplicationController
  def new
  end

  def import
    file = params[:upload].tempfile
    Student.import(file)
    redirect_to root_path
  end
end
