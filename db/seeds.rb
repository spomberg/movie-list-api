require 'faker'
require 'http'
include ListHelper

puts "Seeding data..."

# Users

puts "Creating users..."

User.destroy_all

5.times do
  User.create!(username: Faker::Internet.unique.username, email: Faker::Internet.unique.email, password: Faker::Internet.password)
end

# Creates an array with all the users
users = []

User.each do |user|
  users.push(user)
end

# Lists

puts "Creating lists..."

List.destroy_all

def generate_list_array 
  output = []

  10.times do
    movie_id = rand(2...99999)

    while is_movie_id_valid(movie_id) == false
      movie_id = rand(2...99999)
    end

      output.push(movie_id)

  end

  output
end

20.times do
  users[rand(0...4)].lists.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Quote.yoda,
    movies: generate_list_array,
    is_public: true
  )
end

puts "Done seeding!"