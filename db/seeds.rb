# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require 'faker'

puts 'faker installed'

Reservation.destroy_all
puts 'reserv data Destroyed'

Pool.destroy_all
puts 'pool data Destroyed'

User.destroy_all
puts 'Seed data Destroyed'

# Create users
jean = User.create!(
  email: 'jean@example.com',
  password: 'password',
  user_name: 'Jean',
  bank_information: 'Bank details for Jean'
)

anthony = User.create!(
  email: 'anthony@example.com',
  password: 'password',
  user_name: 'Anthony',
  bank_information: 'Bank details for Anthony'
)

samy = User.create!(
  email: 'samy@example.com',
  password: 'password',
  user_name: 'Samy',
  bank_information: 'Bank details for Samy'
)

puts 'Users data created'

# Create pools
10.times do
  user = [jean, anthony, samy].sample
  pool = Pool.new(
    price: rand(100..350),
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    description: Faker::Lorem.sentence,
    length: rand(0.0..5.0).round(1),
    width: rand(0.0..5.0).round(1),
    depth: rand(0.0..5.0).round(1),
    shape: ['round', 'square', 'drop', 'natural'].sample,
    facilities: ['BBQ', 'transat', 'ballon', 'umbrella', 'shower'].sample,
    user: user
  )

  img_src = URI.open("https://source.unsplash.com/random?pool=#{rand(1..100)}")
  pool.photo.attach(io: img_src, filename: "pools.png", content_type: 'image/png')
  pool.save
end

puts 'Pools data created'

# Create reservations
6.times do
  pool = Pool.all.sample
  user = [jean, anthony, samy].sample
  Reservation.create!(
    start_date: Faker::Date.between(from: Date.today + 1, to: Date.today + 30),
    start_time: Faker::Date.between(from: Date.today + 1, to: Date.today + 30),
    end_time: Faker::Date.between(from: Date.today + 31, to: Date.today + 60),
    owner_acceptation: false,
    user: user,
    pool: pool
  )
end


puts 'Reservations data created'

puts 'Seed data created'
