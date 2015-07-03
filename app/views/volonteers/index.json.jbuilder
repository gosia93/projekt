json.array!(@volonteers) do |volonteer|
  json.extract! volonteer, :id, :name, :surname, :age, :city, :about, :user_id, :volontary_type_id
  json.url volonteer_url(volonteer, format: :json)
end
