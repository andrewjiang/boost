# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Rails.env == 'development'
  alice = User.create(
    :email => "alice@example.com", 
    :first_name => "Alice",
    :last_name => "Summers",
    :phone_number => "123-456-7891", 
    :address => "123 Market St., San Francisco, CA", 
    :password => "password")

  bob = User.create(
    :email => "bob@example.com", 
    :first_name => "Bob",
    :last_name => "Marley",
    :phone_number => "912-1316-1232", 
    :address => "631 Folsom St., San Francisco, CA", 
    :password => "password")

  d = DateTime.current.beginning_of_day
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => alice.id, :status => 'reserved', :fee => 50)
  d = d.advance(:days => +1)
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => alice.id, :status => 'reserved', :fee => 50)
  d = d.advance(:days => +1)
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => bob.id, :status => 'reserved', :fee => 50)
  d = d.advance(:days => +1)
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => bob.id, :status => 'reserved', :fee => 50)
  d = d.advance(:days => +1)
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => alice.id, :status => 'reserved', :fee => 50)
  d = d.advance(:days => +1)
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => bob.id, :status => 'reserved', :fee => 50)
  d = d.advance(:days => +1)
  CarSlot.create(:start_time => d, :end_time => d.end_of_day(), :user_id => alice.id, :status => 'reserved', :fee => 50)

end
