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

User.find_or_create_by!(username: "Admin3") do |user|
     user.username = "Admin3"
     user.lastname = "Admin"
     user.firstname = "Theboss3"
     user.role = "Admin"
     user.password_digest= BCrypt::Password.create('1234')
     user.email = "admin1@gmail.com"
  end

User.create!(username:"Admin2", lastname:"Admin2", firstname:"TheSecondBoss", role:"Admin", password_digest: BCrypt::Password.create('1234') , email:"administrator@gmail.com")

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
    device.description = 'PC' + #{count}
    device.equipment_type = InterventionType.first
    end
end

# Create Devices Switch
5.times do |count|
  Device.create! do |device|
    device.description = 'Server' + #{count}
    device.equipment_type = InterventionType.second
    end
end

# Create 100 Interventions
# Use create! to see errors in validations
2.times do
  Intervention.create! do |intervention|   
    intervention.intervention_type_id = InterventionType.all.sample
    intervention.user_id = User.all.sample
    intervention.device_id = Device.all.sample
    intervention.intervention_state_id = InterventionState.all.sample 
    intervention.details = Faker::Lorem.words(number: 4, supplemental: true) #=> ["Planned", "Regulary", "Removed", "Fixed"]
    intervention.summary = Faker::Lorem.sentence(word_count: 6) 
    end
end


