class CreateStudentTimeTableJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :students, :time_tables do |t|
      # t.index [:student_id, :time_table_id]
      # t.index [:time_table_id, :student_id]
    end
  end
end
