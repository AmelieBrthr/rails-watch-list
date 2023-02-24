# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'
require 'open-uri'

url = "https://tmdb.lewagon.com/movie/top_rated"
serialized_movies = URI.open(url).read
movies = JSON.parse(serialized_movies)
data = movies['results']
picture_url = 'https://image.tmdb.org/t/p/w500'

data.each do |movie|
  new_movie = Movie.create(title: movie["title"], overview: movie["overview"], poster_url: "#{picture_url}#{movie['poster_path']}", rating: movie["vote_average"])
end
