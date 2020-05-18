# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Clearing database..."
User.destroy_all

puts "Creating pins"
pins = User.create!(
  first_name: "Pins",
  last_name: "Thoo",
  address: "123 Kuala Lumpur",
  phone_number: "09099887766",
  email: "pins.thoo@gmail.com",
  password: "123456"
  )
puts "Done"

puts "Creating katsu"
katsu = User.create!(
  first_name: "Katsu",
  last_name: "Furugen",
  address: "456 Yokohama",
  phone_number: "09087651234",
  email: "katsu.furugen@gmail.com",
  password: "123456"
  )
puts "Done"

puts "Creating yusuke"
yusuke = User.create!(
  first_name: "Yusuke",
  last_name: "Ishida",
  address: "789 Meguro",
  phone_number: "09056781234",
  email: "yusuke.ishida@gmail.com",
  password: "123456"
  )

puts "Done"


puts "Creating fake seeds"
50.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: "123456"
    )
end


puts "Done!"
