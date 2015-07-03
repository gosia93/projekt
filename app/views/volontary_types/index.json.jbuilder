json.array!(@volontary_types) do |volontary_type|
  json.extract! volontary_type, :id, :name
  json.url volontary_type_url(volontary_type, format: :json)
end
