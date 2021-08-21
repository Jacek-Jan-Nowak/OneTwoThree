puts "Resetting database"
Place.destroy_all
Event.destroy_all
User.destroy_all



# puts 'Creating 1 test user... pass testing'

# User.create!(
#   email: "testing@testing.com",
#   username: "testing",
#   password: "testing"
# )
# puts 'TEST users created!'

puts 'Creating 10 fake users...'
2.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    password: "testing",
    is_pro?: [true, false].sample
  )
end
puts '10 users created!'


puts 'Creating 10 places...'
10.times do 
  Place.create!(
    name: Faker::Quote.robin,
    address: Faker::Address.street_address,
    # user: User.find_by(is_pro?: true),
  )
end
puts '10 places created!'

puts 'Creating 10 events...'
10.times do 
  Event.create!(
    name: Faker::Music::Opera.rossini,
    event_type: ["Lesson", "Event", "Booking"].sample,
    host: User.last,
    place: Place.all.sample,
    start_time: DateTime.new
  )
end
puts '10 events created!'
