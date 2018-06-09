json.extract! song, :id, :songname, :singername, :mp4, :mp3, :lyrics, :created_at, :updated_at
json.url song_url(song, format: :json)
