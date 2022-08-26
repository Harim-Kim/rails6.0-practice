class StudentController < ApplicationController
  before_action :authenticate_student!
  def index
    @timetables = TimeTable.all

  end
end
