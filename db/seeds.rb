# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'


puts "Clearing database..."
Reservation.destroy_all
Babysitter.destroy_all
User.destroy_all

puts "Creating pins"
pins = User.create!(
  first_name: "Pins",
  last_name: "Thoo",
  address: "123 Kuala Lumpur, Tokyo",
  phone_number: "09099887766",
  email: "pins.thoo@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/pins-thoo'
  )
puts "Done"

puts "Starting to create pins babysitter"

pins_sitter = Babysitter.new(
  age: 27,
  price_per_hour: 2000,
  description: "I'm good at design"
  )
pins_sitter.user = pins
pins_sitter.save!

puts "Done creating #{pins.first_name} the babysitter"

puts "Creating katsu"
katsu = User.create!(
  first_name: "Katsu",
  last_name: "Furugen",
  address: "456 Shinjuku 3-chome, Tokyo",
  phone_number: "09087651234",
  email: "katsu.furugen@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/Katsulincon'
  )
puts "Done"

puts "Creating Bill"
bill = User.create!(
  first_name: "Bill",
  last_name: "Cosby",
  address: "456 Shinjuku 2-chome, Tokyo",
  phone_number: "09056741234",
  email: "bill.cosby@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/mrnakamura721'
  )
puts "Done"

bill_sitter = Babysitter.new(
  age: 82,
  price_per_hour: 10000,
  description: "I'm mr nice guy! I love playing with kids"
  )

bill_sitter.user = bill
bill_sitter.save!

puts "Done creating #{bill.first_name} the babysitter"

puts "Creating Shogo"
shogo = User.create!(
  first_name: "Shogo",
  last_name: "Hida",
  address: "456 Shinjuku 1-chome, Tokyo",
  phone_number: "0901234697534",
  email: "shogo.hida@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/shogohida'
  )
puts "Done"

shogo_sitter = Babysitter.new(
  age: 82,
  price_per_hour: 1800,
  description: "Hi! I'm Shogo! I love Rick Astley"
  )

shogo_sitter.user = shogo
shogo_sitter.save!

puts "Done creating #{shogo.first_name} the babysitter"

puts "Creating yusuke"
yusuke = User.create!(
  first_name: "Yusuke",
  last_name: "Ishida",
  address: "789 Meguro, Tokyo",
  phone_number: "09056781234",
  email: "yusuke.ishida@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/yusuke0127'
  )

puts "Done"

yusuke_sitter = Babysitter.new(
  age: 27,
  price_per_hour: 1500,
  description: "I love kids! I'm here if you need help"
  )

yusuke_sitter.user = yusuke
yusuke_sitter.save!

puts "Done creating #{yusuke.first_name} the babysitter"

puts "Creating doug"
doug = User.create!(
  first_name: "Doug",
  last_name: "Berkely",
  address: "Meguro 'murica",
  phone_number: "0905123123213",
  email: "doug.berkely@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/dmbf29'
  )

puts "Done creating #{doug.first_name}"

puts "Creating trouni"
trouni = User.create!(
  first_name: "Trouni",
  last_name: "Tiet",
  address: "Meguro france",
  phone_number: "0905126823213",
  email: "trouni@gmail.com",
  password: "123456",
  image_url: 'https://kitt.lewagon.com/placeholder/users/random'
  )

puts "Done creating #{trouni.first_name}"

puts "Creating a reservation"


reservation_2 = Reservation.new(
  start_time: Faker::Time.forward(days: 1, period: :afternoon),
  end_time: Faker::Time.forward(days: 1, period: :evening),
  number_of_children: 1
  )
reservation_2.user = trouni
reservation_2.babysitter = yusuke_sitter
reservation_2.save!

status = ['past', 'confirmed', 'cancelled']
babysitter_list = [pins_sitter, yusuke_sitter]

10.times do
  reservation = Reservation.new(
    start_time: Faker::Time.backward(days: 14, period: :afternoon),
    end_time: Faker::Time.backward(days: 14, period: :evening),
    number_of_children: rand(1..8),
    status: status.sample
    )
  reservation.user = katsu
  reservation.babysitter = babysitter_list.sample
  reservation.save!
end

puts "Done creating a fake reservation"
address_list = ['Meguro, Tokyo', 'Shibuya, Tokyo', 'Shinjuku, Tokyo', 'Ropponggi, Tokyo']
puts "Creating fake seeds"
10.times do
  image_url = open('http://le-wagon-tokyo.herokuapp.com/batches/394/student').read
  fake_user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: address_list.sample,
    phone_number: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    password: "123456",
    image_url: image_url
    )
  baby_sitter = Babysitter.new(
    age: rand(18..50),
    price_per_hour: rand(1000..5000),
    description: Faker::Movie.quote
    )
  baby_sitter.user = fake_user
  baby_sitter.save!
end


puts "Done!"
