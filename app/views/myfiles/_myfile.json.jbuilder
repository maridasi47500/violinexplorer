json.extract! myfile, :id, :filename, :song_id, :created_at, :updated_at
json.url myfile_url(myfile, format: :json)
