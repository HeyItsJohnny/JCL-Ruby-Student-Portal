json.array!(@comments) do |comment|
  json.extract! comment, :id, :subject, :content, :userid
  json.url comment_url(comment, format: :json)
end
