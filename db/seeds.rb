puts "Resetting database"
Place.destroy_all
Event.destroy_all
User.destroy_all
Invite.destroy_all
Group.destroy_all


Faker::Config.locale 


puts 'Creating 1 test user... pass testing'

User.create!(
  email: "testing@testing.com",
  username: "testing",
  password: "testing",
  is_pro?: true,
  role: ["lead", "follower", "lead/follower"].sample
)
puts 'TEST users created!'

puts 'Creating 10 fake users...'
10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    password: "testing",
    is_pro?: [true, false].sample,
    role: ["lead", "follower", "lead/follower"].sample,
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
    event_type: ["Lesson", "Event"].sample,
    host: User.all.sample,
    place: Place.all.sample,
    start_time: rand(1..100).days.from_now
  )
end
puts '10 events created!'

puts 'creating 10 groups!'
10.times do
  Group.create!(
    name: Faker::Marketing.buzzwords,
    event: Event.all.sample,
    owner: User.all.sample,
  )
end

puts 'Creating invitations...'


10.times do
  Invite.create!(
    inviter: User.all.sample,
    invitee: User.all.sample,
    confirmed?: true,
    group: Group.all.sample,
    message: Faker::Marketing.buzzwords
  )
end

puts 'invitations CREATED...'
puts "ALL DONE"