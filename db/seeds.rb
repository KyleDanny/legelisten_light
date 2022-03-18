# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning database..'

p 'Destroying people..'
Person.destroy_all

p 'Destroying clinic..'
Clinic.destroy_all

# puts 'Destroying Person_..'
# UserInterest.destroy_all

puts 'Creating Persons'
5.times do
  person = Person.create(
    name: Faker::Name.name,
    hprId: rand(1000000..1000999), 
  )
  puts "Person #{person.id} is created"
end

puts "done"

puts 'Creating Clinics'
5.times do
  clinic = Clinic.create(
    name: Faker::Company.name,
    address: Faker::Address.street_address,
    contact_number: Faker::PhoneNumber.cell_phone,
    rating: rand(1..5)
  )
  puts "clinic #{clinic.id} is created"
end

puts "done"

