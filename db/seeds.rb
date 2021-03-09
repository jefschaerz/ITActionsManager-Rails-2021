# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# OK : User.create!(username:"FromSeek2", lastname:"TestFS", firstname:"test2", role:"Admin", password_digest: BCrypt::Password.create('1234') , email:"abc@gmail.com")
# Add admin
User.create!(username:"Admin2", lastname:"Admin2", firstname:"Theboss", role:"Admin", password_digest: BCrypt::Password.create('1234') , email:"admin1@gmail.com")

# Create 10 users. 
# Use create! to see errors in validations
10.times do
  User.create! do |user|
    user.firstname = Faker::Name.first_name
    user.lastname = Faker::Name.last_name
    user.username = user.lastname + user.firstname
    user.email = Faker::Internet.email
    user.password_digest = BCrypt::Password.create('1234')
    user.role = "Contributor"
    end
end

# Create 5 Intervention types

# Create Intervention States

# Create Devices

# Create 100 Interventions


