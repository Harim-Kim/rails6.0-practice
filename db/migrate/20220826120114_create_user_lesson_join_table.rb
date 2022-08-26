class CreateUserLessonJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :lessons do |t|
      # t.index [:user_id, :lesson_id]
      # t.index [:lesson_id, :user_id]
    end
  end
end
