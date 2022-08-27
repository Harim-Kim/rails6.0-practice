class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :lesson_type
      t.references :tutor, null: false, foreign_key: true
      t.references :time_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
