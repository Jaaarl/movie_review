# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
genres = [
  "Action",
  "Adventure",
  "Comedy",
  "Drama",
  "Fantasy",
  "Horror",
  "Science Fiction (Sci-Fi)",
  "Thriller",
  "Mystery",
  "Romance",
  "Animation",
  "Documentary",
  "Musical",
  "Historical",
  "Western",
  "Family",
  "Superhero",
  "Biographical",
  "War",
  "Sport"
]

genres.each do |genre|
  Category.create(name: genre)
end