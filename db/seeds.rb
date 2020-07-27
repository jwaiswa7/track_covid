# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def create_user
  while User.count < 5
    puts "creating user #{User.count}"
    User.create([{ imei: Faker::Code.imei, nin: Faker::Code.nric }])
    end
end

def create_hot_spot
  puts 'creating Hot spots'
  HotSpot.create([{ name: 'Nkumba University', street: 'Nukmba University', country: 'Uganda' }, { name: 'Entebbe Airport', street: 'Entebbe Airport', country: 'Uganda' }, { name: 'Victorial mall', street: 'Victoria Mall', country: 'Uganda' }, { name: 'Imperial Mall', street: 'Imperial Mall', country: 'Uganda' }])
end

def create_movement
  return if Movement.count > 0

  puts 'creating movement'
  Movement.create([{ user: User.first, hot_spot_id: HotSpot.first.id }])
end

create_user
create_hot_spot
create_movement
