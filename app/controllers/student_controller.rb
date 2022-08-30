class StudentController < ApplicationController
  before_action :authenticate_student!
  def index
    @timetables = TimeTable.all
    @lessons = Lesson.where("student_id = ?", current_student.id)
    # render json: @timetables
  end

  def enroll
    lesson = Lesson.find(params[:lesson_id])
    lesson.update(student_id: current_student.id)
    lesson.save
    redirect_to '/student'
    # respond_to do |format|
    #   if lesson.save
    #     format.html { redirect_to lesson_url(lesson), notice: "Lesson was successfully created." }
    #     format.json { render :show, status: :created, location: lesson }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: lesson.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def unenroll
    lesson = Lesson.find(params[:lesson_id])
    lesson.update(student_id: 0)
    lesson.save
    redirect_to '/student'
  end

  def index_20
    @timetables = TimeTable.all
    @lessons = Lesson.where("lesson_type = 1 and student_id = ?", current_student.id)
  end
  def index_40
    @timetables = TimeTable.all
    @lessons = Lesson.where("lesson_type = 2 and student_id = ?", current_student.id)
  end
  def lessons
    @timetable = TimeTable.find(params[:time_table_id])
    @lessons = @timetable.lessons.where("student_id = 0")
  end
  def lessons_20
    @timetable = TimeTable.find(params[:time_table_id])
    @lessons = @timetable.lessons.where("lesson_type = 1 and student_id = 0")
  end

  def lessons_40
    @timetable = TimeTable.find(params[:time_table_id])
    @lessons = @timetable.lessons.where("lesson_type = 2  and student_id = 0")
  end
end
