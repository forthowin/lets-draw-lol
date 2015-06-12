# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

champ_cat = Category.create(name: "Champions")

response = JSON.parse(open("https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=#{ENV['RIOT_API_KEY']}").read)

response["data"].keys.each do |name|
  Picture.create(name: name, image: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/#{name}_0.jpg", category: champ_cat)
end