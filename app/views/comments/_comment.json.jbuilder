json.extract! comment, :id, :song_id, :content, :image, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
