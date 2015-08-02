json.array!(@search_organisations) do |search_organisation|
  json.extract! search_organisation, :id, :city, :volontary_type_id
  json.url search_organisation_url(search_organisation, format: :json)
end
