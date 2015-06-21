Fabricator(:picture) do
  name { Faker::Internet.user_name }
  image { "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/Thresh_0.jpg" }
end