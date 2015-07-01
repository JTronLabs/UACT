json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :date_and_time_of_event
  json.url event_url(event, format: :json)
end
