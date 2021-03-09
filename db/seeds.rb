# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# OK : User.create!(username:"FromSeek2", lastname:"TestFS", firstname:"test2", role:"Admin", password_digest: BCrypt::Password.create('1234') , email:"abc@gmail.com")
# Add Admin users
User.find_or_create_by!(username: "Admin1") do |user|
     user.username = "Admin1"
     user.lastname = "Admin"
     user.firstname = "TheBoss"
     user.role = "admin"
     user.password_digest= BCrypt::Password.create('1234')
     user.email = "admin1@gmail.com"
  end


User.find_or_create_by!(username: "Admin2") do |user|
     user.username = "Admin2"
     user.lastname = "Admin2"
     user.firstname = "TheSecondBoss"
     user.role = "admin"
     user.password_digest= BCrypt::Password.create('1234')
     user.email = "admin2@gmail.com"
  end

# Add 1 Contributor : UserA
User.find_or_create_by!(username: "UserA") do |user|
     user.username = "UserA"
     user.lastname = "UserA"
     user.firstname ="SimpleUser"
     user.role = "contributor"
     user.password_digest= BCrypt::Password.create('1234')
     user.email = "usera@gmail.com"
  end

# Create 10 Contributors users. 
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

# Create Intervention types
InterventionType.create!(description:'Incident');
InterventionType.create!(description:'Maintenance')
InterventionType.create!(description:'Update')
InterventionType.create!(description:'Information')

# Create Intervention States
InterventionState.create!(description:'Open')
InterventionState.create!(description:'Closed')
InterventionState.create!(description:'Pending')

# Create Intervention States
EquipmentType.create!(description:'PC')
EquipmentType.create!(description:'Server')
EquipmentType.create!(description:'Printer')
EquipmentType.create!(description:'NAS')
EquipmentType.create!(description:'Switch')

# Create Devices PC
5.times do |count|
  Device.create! do |device|
    device.description = 'PC' + Faker::Number.decimal_part(digits: 3) 
    device.equipment_type_id = EquipmentType.first.id
    end
end

# Create Devices Server
5.times do |count|
  Device.create! do |device|
    device.description = 'Server' + Faker::Number.decimal_part(digits: 3)
    device.equipment_type_id = EquipmentType.second.id
    end
end

# Create Devices Switch
5.times do |count|
  Device.create! do |device|
    device.description = 'Printer' + Faker::Number.decimal_part(digits: 3)
    device.equipment_type_id = 3
    end
end

# Create Devices NAS
5.times do |count|
  Device.create! do |device|
    device.description = 'NAS' + Faker::Number.decimal_part(digits: 2)
    device.equipment_type_id = 4
    end
end

# Create Devices Switch
5.times do |count|
  Device.create! do |device|
    device.description = 'Switch' + Faker::Number.decimal_part(digits: 2)
    device.equipment_type_id = 5
    end
end

# Create 100 Interventions
# Use create! to see errors in validations
100.times do
  Intervention.create! do |intervention|   
    intervention.intervention_type_id = InterventionType.all.sample.id
    intervention.date = Faker::Time.between(from: DateTime.now - 20, to: DateTime.now)
    intervention.user_id = User.all.sample.id
    intervention.device_id = Device.all.sample.id
    intervention.intervention_state_id = InterventionState.all.sample.id 
    intervention.summary = Faker::Lorem.sentence(word_count: 3) 
    intervention.details = Faker::Lorem.sentence(word_count: 6) 
    end
end


