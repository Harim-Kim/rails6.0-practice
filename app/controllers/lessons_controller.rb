class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show edit update destroy ]
  before_action :authenticate_tutor!, only: %i[edit create update destroy]
  # GET /lessons or /lessons.json
  def index
    if params.has_key?(:time_table_id)
      @lessons = TimeTable.find(params[:time_table_id]).lessons
    else
      @lessons = Lesson.all
    end
  end

  # GET /lessons/1 or /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @time_table_id = params[:time_table_id]
    start_time = TimeTable.find(@time_table_id).start_time

    lessons = current_tutor.lessons
    lessons.each do |l|
      if l.start_time <= start_time and start_time < l.end_time
        redirect_to request.referrer, notice: "기존 수업과 시간이 겹칩니다"
        break
      end
    end
    @lesson = Lesson.new

  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons or /lessons.json
  def create
    start_time = TimeTable.find(lesson_params["time_table_id"]).start_time
    @end_time = start_time + 20.minutes
    if lesson_params[:lesson_type] = 2
      @end_time = @end_time + 20.minutes
    end

    @lesson = Lesson.new(:start_time => start_time,
                         :end_time => @end_time,
                         :lesson_type => lesson_params["lesson_type"],
                         :tutor_id => lesson_params["tutor_id"],
                         :time_table_id => lesson_params["time_table_id"])


    respond_to do |format|
      if @lesson.save
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully created." }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1 or /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to lesson_url(@lesson), notice: "Lesson was successfully updated." }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1 or /lessons/1.json
  def destroy
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to lessons_url, notice: "Lesson was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params[:lesson][:tutor_id] = current_tutor.id
      # params[:lesson][:time_table_id] = params[:time_table_id]
      params.require(:lesson).permit(:start_time, :end_time, :lesson_type, :tutor_id, :time_table_id)
    end
end
