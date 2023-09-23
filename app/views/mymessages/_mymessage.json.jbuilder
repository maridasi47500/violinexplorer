json.extract! mymessage, :id, :content, :user_id, :created_at, :updated_at
json.url mymessage_url(mymessage, format: :json)
