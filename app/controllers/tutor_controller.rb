class TutorController < ApplicationController
  before_action :authenticate_tutor!, only: %i[lessons, index]
  def index
    @timetables = TimeTable.all
    # @tutor = current_tutor\
    @tutor_lessons = Tutor.find(current_tutor.id).lessons
  end

  def lessons
    @tutor_lessons = Tutor.find(params[:id]).lessons
    @tutor = Tutor.find(params[:id])
  end
end
