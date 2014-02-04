# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == 'development'

  User.destroy_all
  CarSlot.destroy_all
  Car.destroy_all

  car_1 = Car.create(
    :make           => "Honda",
    :model          => "Accord",
    :color          => "Blue",
    :year           => 2008,
    :vin            => "1M8GDM9A_KP042788",
    :license_number => "4DKE21KT"
  )

  alice = User.create(
    :email                => "alice@example.com",
    :first_name           => "Alice",
    :last_name            => "Summers",
    :phone_number         => "(555) 555-5555",
    :gender               => "f",
    :address              => "123 Market St., San Francisco, CA",
    :password             => "password",
    :default_car_schedule => User::DAYNAMES.values_at(*[0, 2, 4, 5]),
    :parking_instructions => "Drop off the car for at Portsmouth Square Garage. Passcode is 4321",
    :parking_timing       => "10:00 a.m.",
    :how_to_contact       => "Text",
    :car                  => car_1
  )

  bob = User.create(
    :email                => "bob@example.com",
    :first_name           => "Bob",
    :last_name            => "Marley",
    :phone_number         => "(925) 123-4567",
    :gender               => "m",
    :address              => "631 Folsom St., San Francisco, CA",
    :password             => "password",
    :default_car_schedule => User::DAYNAMES.values_at(*[1, 3, 6]),
    :parking_instructions => "Drop off the car in my drive way at 631 Folsom St. It's the green house.",
    :parking_timing       => "8:00 a.m.",
    :how_to_contact       => "Call",
    :car                  => car_1
  )

  car_1.create_default_car_slots(DateTime.current)
  car_1.create_default_car_slots(DateTime.current.advance(:weeks => +1))

  car_2 = Car.create(
    :make           => "Toyota",
    :model          => "Prius",
    :color          => "White",
    :year           => 2010,
    :vin            => "4KDK868C_808VDUE9",
    :license_number => "8KH7HG7"
  )

  carol = User.create(
    :email                => "carol@example.com",
    :first_name           => "Carol",
    :last_name            => "Witherspoon",
    :phone_number         => "534-435-7479",
    :gender               => "f",
    :address              => "400 Howard St., San Francisco, CA",
    :password             => "password",
    :default_car_schedule => User::DAYNAMES.values_at(*[1, 2, 3, 6]),
    :parking_instructions => "Drop off the car near the intersection of 2nd and Folsom.",
    :parking_timing       => "7:00 a.m.",
    :how_to_contact       => "Call",
    :car                  => car_2
  )

  car_2.create_default_car_slots(DateTime.current)
  car_2.create_default_car_slots(DateTime.current.advance(:weeks => +1))

end
