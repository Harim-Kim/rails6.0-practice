json.extract! lesson, :id, :start_time, :end_time, :lesson_type, :tutor_id, :time_table_id, :student_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
