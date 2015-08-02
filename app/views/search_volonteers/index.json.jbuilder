json.array!(@search_volonteers) do |search_volonteer|
  json.extract! search_volonteer, :id, :city, :volontary_type_id
  json.url search_volonteer_url(search_volonteer, format: :json)
end
