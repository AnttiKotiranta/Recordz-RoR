json.array!(@bands) do |band|
  json.extract! band, :id, :name, :info, :formed, :status
  json.url band_url(band, format: :json)
end
