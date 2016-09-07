json.extract! lesson, :id, :title, :content, :week_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)