module ApplicationHelper

  def name_list
    ["Aatrox", "Ahri", "Akali", "Alistar", "Amumu", "Anivia", "Annie", "Ashe", "Azir",
     "Bard", "Blitzcrank", "Brand", "Braum",
     "Caitlyn", "Cassiopeia", "Cho'Gath", "Corki",
     "Darius", "Diana", "Dr. Mundo", "Draven",
     "Ekko", "Elise", "Evelynn", "Ezreal",
     "Fiddlesticks", "Fiora", "Fizz",
     "Galio", "Gangplank", "Garen", "Gnar", "Gragas", "Graves",
     "Hecarim", "Heimerdinger",
     "Irelia",
     "Janna", "Jarvan IV", "Jax", "Jayce", "Jinx",
     "Kalista", "Karma", "Karthus", "Kassadin", "Katarina", "Kayle", "Kennen", "Kha'Zix", "Kog'Maw",
     "LeBlanc", "Lee Sin", "Leona", "Lissandra", "Lucian", "Lulu", "Lux",
     "Malphite", "Malzahar", "Maokai", "Master Yi", "Miss Fortune", "Mordekaiser", "Morgana",
     "Nami", "Nasus", "Nautilus", "Nidalee", "Nocturne", "Nunu",
     "Olaf", "Orianna",
     "Pantheon", "Poppy",
     "Quinn",
     "Rammus", "Rek'Sai", "Renekton", "Rengar", "Riven", "Rumble", "Ryze",
     "Sejuani", "Shaco", "Shen", "Shyvana", "Singed", "Sion", "Sivir", "Skarner", "Sona", "Soraka", "Swain", "Syndra",
     "Talon", "Taric", "Teemo", "Thresh", "Tristana", "Trundle", "Tryndamere", "Twisted Fate", "Twitch",
     "Udyr", "Urgot",
     "Varus", "Vayne", "Veigar", "Vel'Koz", "Vi", "Viktor", "Vladimir", "Volibear",
     "Warwick", "Wukong",
     "Xerath", "Xin Zhao",
     "Yasuo", "Yorick",
     "Zac", "Zed", "Ziggs", "Zilean", "Zyra",
     "Aphromoo",
     "Balls", "Bjersen",
     "Doublelift", "Dyrus",
     "Faker",
     "Hai", "HotshotGG",
     "Imaqtpie",
     "Kiwikid",
     "Lemonnation", "Lustboy",
     "Meteos",
     "Piglet", "Pobelter",
     "Quas",
     "Reginald",
     "Saintvicious", "Santorin", "Seraph", "Scarra", "Shiphtur", "Sneaky",
     "TheOddOne",
     "Voyboy",
     "Wildturtle",
     "Xiaweixiao", "Xpecial",
     "ZionSpartan"]
  end

  def order_list
    ["Newest", "Oldest", "Popularity", "Comments"]
  end

  def like_button_color
    if !user_signed_in?
        "color:white"
    elsif Like.where("drawing_id = ? AND user_id = ?", @drawing.id, current_user.id).empty?
        "color:white"
    else
        "color:blue"
    end
  end
end
