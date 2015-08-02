json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :commentable_id, :commentable_type, :user_id, :status
  json.url comment_url(comment, format: :json)
end
