puts "Resetting database"
Place.destroy_all
Event.destroy_all
User.destroy_all

Faker::Config.locale 


puts 'Creating 1 test user... pass testing'

User.create!(
  email: "testing@testing.com",
  username: "testing",
  password: "testing",
  is_pro?: true
)
puts 'TEST users created!'

puts 'Creating 20 fake users...'
20.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
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
    owner: User.all.sample,
  )
end
puts '10 places created!'

puts 'Creating 10 events...'
10.times do 
  Event.create!(
    name: Faker::Music::Opera.rossini,
    event_type: ["Lesson", "Event", "Booking"].sample,
    host: User.all.sample,
    place: Place.all.sample,
    start_time: DateTime.new
  )
end
puts '10 events created!'

puts 'Creating invitations...'

20.times do
  Invite.create!(
    message: Faker::Marketing.buzzwords
  )
end

puts 'Invitations crated!'

puts 'Creating user_events...'
 40.times do
  UserEvent.create!(
    event: Event.all.sample,
    invite: Invite.all.sample,
    is_confirmed?: [true, false].sample,
    dancer: User.all.sample
  )
 end
puts 'User_Events created!'