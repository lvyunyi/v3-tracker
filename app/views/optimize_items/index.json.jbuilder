json.array!(@optimize_items) do |optimize_item|
  json.extract! optimize_item, :id, :content, :status, :from, :in_charge
  json.url optimize_item_url(optimize_item, format: :json)
end
