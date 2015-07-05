json.array!(@users) do |user|
  json.extract! user, :id, :login, :roleable_id, :roleable_type
  json.url user_url(user, format: :json)
end
