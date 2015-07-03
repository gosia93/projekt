json.array!(@individuals) do |individual|
  json.extract! individual, :id, :name, :surname, :age, :city, :about, :needs, :user_id
  json.url individual_url(individual, format: :json)
end
