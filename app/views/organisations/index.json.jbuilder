json.array!(@organisations) do |organisation|
  json.extract! organisation, :id, :name, :regon, :city, :about, :user_id
  json.url organisation_url(organisation, format: :json)
end
