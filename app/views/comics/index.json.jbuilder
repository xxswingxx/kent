json.array!(@comics) do |comic|
  json.extract! comic, :id, :title, :genre, :state, :description
  json.url comic_url(comic, format: :json)
end
