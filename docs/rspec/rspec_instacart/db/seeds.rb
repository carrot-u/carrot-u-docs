# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
include Faker

50.times do
  Customer.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    postal_code: Faker::Address.zip_code,
    valid_payment_method: Faker::Boolean.boolean,
    express_member: Faker::Boolean.boolean
    )
end

50.times do
  Driver.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    drivers_license_number: Faker::Address.state_abbr + Faker::Number.number(6),
    drivers_license_state: Faker::Address.state_abbr,
    vehicle_license_plate: Faker::Number.number(2) + Faker::Address.state_abbr + Faker::Number.number(2),
    background_check_clear: Faker::Boolean.boolean
    )
end
