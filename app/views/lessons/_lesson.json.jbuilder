json.extract! lesson, :id, :image, :title, :duration, :cost, :category, :language, :level, :description, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
