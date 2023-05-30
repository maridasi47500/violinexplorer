json.extract! recording, :id, :filename, :song_id, :created_at, :updated_at
json.url recording_url(recording, format: :json)
