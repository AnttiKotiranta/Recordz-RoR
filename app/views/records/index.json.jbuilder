json.array!(@records) do |record|
  json.extract! record, :id, :name, :info, :year, :performer_id
  json.url record_url(record, format: :json)
end
