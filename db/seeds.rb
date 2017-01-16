# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Creates Wikis
50.times do
  Wiki.create!(
    title: Faker::StarWars.planet,
    body: Faker::StarWars.quote
  )
end
wikis = Wiki.all

# Creates Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
users = User.all

puts "Seed finished"
puts "#{User.count} users created!"
puts "#{Wiki.count} wikis created!"
