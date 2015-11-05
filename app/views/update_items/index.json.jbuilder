json.array!(@update_items) do |update_item|
  json.extract! update_item, :id, :content, :from
  json.url update_item_url(update_item, format: :json)
end
