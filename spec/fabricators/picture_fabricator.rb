Fabricator(:picture) do
  name { Faker::Internet.user_name }
  image { Faker::Internet.url }
end