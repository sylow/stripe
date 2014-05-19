Fabricator(:user) do
  email{ Forgery(:internet).email_address }
  password '11111111'
end