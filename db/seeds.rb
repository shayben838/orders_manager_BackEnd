# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'faker'

300.times do
  # Randomly assign a status from the constants
  latitude = Faker::Address.latitude
  longitude = Faker::Address.longitude
  place_name = Faker::Address.city

  Order.create!(
    title: "#{Faker::Food.dish} for #{Faker::Name.first_name}" + "Generated place: #{place_name}",
    latitude: latitude,
    longitude: longitude,
    order_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    status: Order::STATUS_OPTIONS[:received],
    deleted_at: nil # Assuming no orders are deleted at the time of creation
  )
end

puts "300 dummy orders created!"