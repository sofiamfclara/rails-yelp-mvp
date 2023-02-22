# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

@categories = ["Chinese", "Italian", "Japanese", "French", "Belgian"]

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

15.times do
  restaurant = Restaurant.create!({ name: Faker::Restaurant.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone_with_country_code, category: @categories.sample })
  5.times do
    Review.create!({restaurant: restaurant, rating: rand(0..5), content: Faker::Restaurant.review})
  end
  puts "Created #{restaurant.name}"
end
puts 'Finished!'
