json.array!(@test_items) do |test_item|
  json.extract! test_item, :id, :status, :content, :name
  json.url test_item_url(test_item, format: :json)
end
