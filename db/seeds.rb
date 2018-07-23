# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
  User.create(
    username: "user#{i}",
    email: "user#{i}@user.com",
    password: 'user123'
  )
  Post.create(
    description: 'lovely day',
    user: User.find_by_username("user#{i}"),
    location: Location.new(address: "Groove St. #{i}", lat: i, lng: i)
  )
  Post.find(i + 1).like_by User.find(i + 3)
  Post.find(i + 2).like_by User.find(i + 4)
end
