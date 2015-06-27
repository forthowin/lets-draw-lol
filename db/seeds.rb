# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'

champ_cat = Category.where(name: "Champions").first_or_create
pros_cat = Category.where(name: "Pros").first_or_create

response = JSON.parse(open("https://global.api.pvp.net/api/lol/static-data/na/v1.2/champion?champData=image&api_key=#{ENV['RIOT_API_KEY']}").read)

response["data"].keys.each do |name|
  Picture.where(name: name).first_or_create(image: "http://ddragon.leagueoflegends.com/cdn/img/champion/splash/#{name}_0.jpg", category: champ_cat)
end

Picture.where(name: 'Doublelift').first_or_create(image: 'Clg_doublelift.jpg', category: pros_cat)
Picture.where(name: 'Quas').first_or_create(image: 'Crs_quas.png', category: pros_cat)
Picture.where(name: 'Kiwikid').first_or_create(image: 'Dig_kiwikid.jpg', category: pros_cat)
Picture.where(name: 'Bjergsen').first_or_create(image: 'TSM_Bjergsen.jpg', category: pros_cat)
Picture.where(name: 'Dyrus').first_or_create(image: 'TSM_Dyrus.jpg', category: pros_cat)
Picture.where(name: 'Lustboy').first_or_create(image: 'TSM_Lustboy.jpg', category: pros_cat)
Picture.where(name: 'Santorin').first_or_create(image: 'TSM_Santorin.jpg', category: pros_cat)
Picture.where(name: 'Wildturtle').first_or_create(image: 'TSM_Wildturtle.jpg', category: pros_cat)
Picture.where(name: 'Aphromoo').first_or_create(image: 'CLG_Aphromoo.jpg', category: pros_cat)
Picture.where(name: 'Pobelter').first_or_create(image: 'CLG_Pobelter.jpg', category: pros_cat)
Picture.where(name: 'ZionSpartan').first_or_create(image: 'CLG_ZionSpartan.jpg', category: pros_cat)
Picture.where(name: 'Xpecial').first_or_create(image: 'Xpecial.jpg', category: pros_cat)
Picture.where(name: 'Balls').first_or_create(image: 'balls.jpg', category: pros_cat)
Picture.where(name: 'Faker').first_or_create(image: 'faker.jpg', category: pros_cat)
Picture.where(name: 'Hai').first_or_create(image: 'hai.jpg', category: pros_cat)
Picture.where(name: 'Imaqtpie').first_or_create(image: 'imaqtpie.jpg', category: pros_cat)
Picture.where(name: 'Lemonnation').first_or_create(image: 'lemonnation.jpg', category: pros_cat)
Picture.where(name: 'Meteos').first_or_create(image: 'meteos.jpg', category: pros_cat)
Picture.where(name: 'Piglet').first_or_create(image: 'piglet.jpg', category: pros_cat)
Picture.where(name: 'Scarra').first_or_create(image: 'scarra.jpg', category: pros_cat)
Picture.where(name: 'Sneaky').first_or_create(image: 'sneaky.jpg', category: pros_cat)
Picture.where(name: 'Xiaoweixiao').first_or_create(image: 'xiaoweixiao.PNG', category: pros_cat)
Picture.where(name: 'HotshotGG').first_or_create(image: 'hotshotgg.PNG', category: pros_cat)
Picture.where(name: 'Voyboy').first_or_create(image: 'voyboy.jpg', category: pros_cat)
Picture.where(name: 'TheOddOne').first_or_create(image: 'theoddone.jpg', category: pros_cat)
Picture.where(name: 'Seraph').first_or_create(image: 'seraph.jpg', category: pros_cat)
Picture.where(name: 'Shiphtur').first_or_create(image: 'shiphtur.jpg', category: pros_cat)
Picture.where(name: 'Saintvicious').first_or_create(image: 'saintvicious.jpg', category: pros_cat)
Picture.where(name: 'Reginald').first_or_create(image: 'reginald.jpg', category: pros_cat)