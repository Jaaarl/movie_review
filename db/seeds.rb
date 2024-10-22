# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Category.destroy_all
Movie.destroy_all
MovieCategoryShip.destroy_all
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
]

genres.each do |genre|
  Category.create(name: genre)
end
def random_permalink(length = 7)
  (0...length).map { (65 + rand(26)).chr }.join + rand(1000..9999).to_s # Random letters and numbers
end
10.times do
  Movie.create!(
    title: Faker::Movie.title,
    blurb: Faker::Movie.quote,
    released: Faker::Date.between(from: '1900-01-01', to: '2023-01-01'),
    country_of_origin: Faker::Address.country,
    showing_start: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1.year),
    showing_end: Faker::Time.between(from: DateTime.now + 1.year, to: DateTime.now + 2.years),
    user_id: User.pluck(:id).sample,
    average_rating: Faker::Number.between(from: 1.0, to: 5.0).round(1),
    permalink: random_permalink
  )
end

Movie.all.each do |movie|
  rand(1..5).times do
    Review.create!(
      content: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
      rating: rand(1..5),
      user_id: 1,
      movie_id: movie.id
    )
  end
end

