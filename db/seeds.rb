require 'faker'

puts "Seeding data..."

# Users

puts "Creating users..."

User.destroy_all

5.times do |index|
  User.create!(username: Faker::Internet.unique.username, email: Faker::Internet.unique.email, password: Faker::Internet.password)
end

user = User.first

# Lists

puts "Creating lists..."

List.destroy_all



puts "Done seeding!"