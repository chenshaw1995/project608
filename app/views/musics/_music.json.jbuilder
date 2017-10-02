json.extract! music, :id, :name, :artist, :created_at, :updated_at
json.url music_url(music, format: :json)
