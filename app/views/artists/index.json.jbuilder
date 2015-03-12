json.array!(@artists) do |artist|
  json.extract! artist, :id, :name, :string, :info
  json.url artist_url(artist, format: :json)
end
