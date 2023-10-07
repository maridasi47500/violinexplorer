json.array! @mixers, partial: "mixers/mixer", as: :mixer
json.extract! mixer, :id, :created_at, :updated_at
json.url mixer_url(mixer, format: :json)

