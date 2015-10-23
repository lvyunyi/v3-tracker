json.array!(@items) do |item|
  json.extract! item, :id, :status, :content, :name
  json.url item_url(item, format: :json)
end
