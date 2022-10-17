require "csv"

# Clear the products and categories tables.
Rate.destroy_all
AnimeGenre.destroy_all
Anime.destroy_all
Type.destroy_all
Genre.destroy_all
User.destroy_all

# Loop through the rows of first CSV file.
csv_file = Rails.root.join("db/anime_shorten.csv")
csv_data = File.read(csv_file)

animes = CSV.parse(csv_data, headers: true)

# Loop through the rows of second CSV file.
second_csv_file = Rails.root.join("db/rating_shorten.csv")
second_csv_data = File.read(second_csv_file)

ratings = CSV.parse(second_csv_data, headers: true)

# If CSV was created by Excel in Windows you may also need to set an encoding type:
# products = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

animes.each do |anime|
  genre = Genre.find_or_create_by(name: anime["genre"])
  type = Type.find_or_create_by(name: anime["type"])

  if type && type.valid?

    new_anime = type.animes.build(
      id:       anime["anime_id"],
      name:     anime["name"],
      episodes: anime["episodes"],
      rating:   anime["rating"],
      members:  anime["members"]
    )

    puts "Invalid Anime #{anime['name']}" unless new_anime&.valid?

    # genres
    genres = anime["genre"].split(',').map(&:strip)

    genres.each do |genre_name|
      genre = Genre.find_or_create_by(name: genre_name)

      AnimeGenre.create(anime: new_anime, genre: genre)
    end
  else
    puts "Invalid type #{anime['type']} for anime #{anime['anime']}"
  end
end

ratings.each do |rating|
  user = User.find_or_create_by(id: rating["user_id"])
  user.name = Faker::Name.unique.name
  user.save!

  Rate.create(anime: Anime.find(rating["anime_id"]), user: user, rate: rating["rating"])
end

puts "Created #{Type.count} types"
puts "Created #{Genre.count} Genres"
puts "Created #{Anime.count} animes."
puts "Created #{User.count} Users"
puts "Created #{Rate.count} Rates"
puts "Created #{AnimeGenre.count} AnimeGenres"
