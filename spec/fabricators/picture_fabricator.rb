Fabricator(:picture) do
  name { Faker::Lorem.word }
  image { "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/Thresh_0.jpg" }
end