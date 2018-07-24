# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do |i|
  User.create(
    username: Faker::Internet.username(4),
    email: Faker::Internet.email,
    password: Faker::Internet.password(7)
  )
  Post.create(
    description: Faker::BojackHorseman.quote,
    user: User.find(i + 1),
    location: Location.new(address: Faker::Address.full_address, lat: i, lng: i),
    media: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/testing.jpg'), 'image/jpeg')
  )
  Post.find(i + 1).like_by User.find(i + 3)
  Post.find(i + 2).like_by User.find(i + 4)
end
