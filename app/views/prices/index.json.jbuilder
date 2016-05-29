json.array!(@prices) do |price|
  json.extract! price, :id, :image, :price, :address, :longitude, :latitude, :avg_rating
  json.url price_url(price, format: :json)
end
