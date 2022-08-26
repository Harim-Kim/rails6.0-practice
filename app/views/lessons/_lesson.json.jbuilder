json.extract! lesson, :id, :start_time, :end_time, :type, :tutor_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
