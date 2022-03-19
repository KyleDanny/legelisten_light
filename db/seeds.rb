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

person_one = Person.create(
  name: Faker::Name.name,
  hprId: rand(1000000..1000999),
  legal_name: "Yoda",
  birth_date: "14 February 1978"
)

puts "Person #{person_one.id} is created"

person_two = Person.create(
  name: Faker::Name.name,
  hprId: rand(1000000..1000999),
  legal_name: "Luke Skywalker",
  birth_date: "16 February 1991"
)

puts "Person #{person_two.id} is created"

person_three = Person.create(
  name: Faker::Name.name,
  hprId: rand(1000000..1000999),
  legal_name: "Darth Vader",
  birth_date: "31 April 1988"
)

puts "Person #{person_three.id} is created"

person_four = Person.create(
  name: Faker::Name.name,
  hprId: rand(1000000..1000999),
  legal_name: "Mace Windu",
  birth_date: "09 December 1965"
)

puts "Person #{person_four.id} is created"

person_five = Person.create(
  name: Faker::Name.name,
  hprId: rand(1000000..1000999),
  legal_name: "Chewbacca",
  birth_date: "23 August 1957"
)

puts "Person #{person_five.id} is created"

# 5.times do
#   person = Person.create(
#     name: Faker::Name.name,
#     hprId: rand(1000000..1000999), 
#   )
#   puts "Person #{person.id} is created"
# end

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

puts 'Creating Person Clinics'

clinics = Clinic.all

person_clinic1 = PersonClinic.create(person_id: person_one.id, clinic_id: clinics[0].id)
person_clinic2 = PersonClinic.create(person_id: person_two.id, clinic_id: clinics[1].id)
person_clinic3 = PersonClinic.create(person_id: person_three.id, clinic_id: clinics[2].id)
person_clinic4 = PersonClinic.create(person_id: person_four.id, clinic_id: clinics[3].id)
person_clinic5 = PersonClinic.create(person_id: person_five.id, clinic_id: clinics[4].id)

puts 'done'
