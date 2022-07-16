require 'faker'
require 'http'

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
    output.push(rand(2...99999))
  end

  output
end

puts "Done seeding!"