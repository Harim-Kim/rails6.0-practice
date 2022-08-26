class TutorController < ApplicationController
  before_action :authenticate_tutor!
  def index
    @timetables = TimeTable.all
    # @tutor = current_tutor
  end
end
