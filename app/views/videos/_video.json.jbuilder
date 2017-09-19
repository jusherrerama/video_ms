json.extract! video, :id, :name, :category, :user_id, :address, :created_at, :updated_at
json.url video_url(video, format: :json)
