json.array!(@rates) do |rate|
  json.extract! rate, :id, :rate
  json.url rate_url(rate, format: :json)
end
