json.array!(@plays) do |play|
  json.extract! play, :id, :title, :description, :date_of_play
  json.url play_url(play, format: :json)
end
