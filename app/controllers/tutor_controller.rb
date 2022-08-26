class TutorController < ApplicationController
  before_action :authenticate_tutor!
  def index
    @timetables = TimeTable.all

  end
end
