require 'faker'
require 'http'
require 'nanoid'
include ListHelper

puts "Seeding data..."

List.destroy_all
User.destroy_all

# Users

puts "Creating users..."


5.times do |index|
  User.create!(
    _id: index,
    username: Faker::Internet.unique.username, 
    email: Faker::Internet.unique.email, 
    password: Faker::Internet.password
  )
end

# Creates an array with all the users
users = []

User.each do |user|
  users.push(user)
end

# Lists

puts "Creating lists..."

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

20.times do |index|
  users[rand(0...4)].lists.create!(
    _id: index,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Quote.yoda,
    movies: generate_list_array,
    is_public: true,
    created_on: Faker::Date.backward(days: 2)
  )
end

puts "Done seeding!"