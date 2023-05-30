json.extract! video, :id, :filename, :song_id, :created_at, :updated_at
json.url video_url(video, format: :json)
