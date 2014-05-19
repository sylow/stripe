Fabricator(:subscription) do
  user
  stripe_token 'token'
end