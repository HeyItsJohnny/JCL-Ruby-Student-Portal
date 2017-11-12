json.array!(@accounts) do |account|
  json.extract! account, :email, :password_digest
  json.url account_url(account, format: :json)
end
