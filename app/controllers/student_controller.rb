class StudentController < ApplicationController
  before_action :authenticate_student!
  def index
    @timetables = TimeTable.all
    @current_date = Time.now
  end

  def enroll

  end

  def unenroll

  end

  def lesson_20
    @timetables = TimeTable.all
    @current_date = Time.now
  end
  def lesson_40
    @timetables = TimeTable.all
    @current_date = Time.now
  end
end
