require 'csv'
require 'open-uri'
require 'nokogiri'
puts "Resetting database"
Event.destroy_all
User.destroy_all
Place.destroy_all
Invite.destroy_all
Group.destroy_all

Faker::Config.locale 

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'app/assets/csv/open_pub.csv'
userfilepath = 'app/assets/csv/random_london.csv'

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
CSV.foreach(userfilepath, csv_options).with_index do |row, index|
  break if index == 15
    User.create!(
      email: Faker::Internet.email,
      username: Faker::Internet.username,
      password: "testing",
      is_pro?: [true, false].sample,
      role: ["lead", "follower", "lead/follower"].sample,
      address: row['address'],
    )
end
puts '10 users created!'


puts 'Creating 10 places...'


CSV.foreach(filepath, csv_options).with_index do |row, index|
    puts "creating place number #{index}"
    break if index == 15
    Place.create!(
    name: row['name'],
    address: row['address'],
    latitude: row['latitude'].to_f,
    longitude: row['longitude'].to_f, 
    # user: User.find_by(is_pro?: true),
    owner: User.all.sample,
  )
  index += 1
end
=begin 10.times do 
  Place.create!(
    name: Faker::Quote.robin,
    address: Faker::Address.street_address,
    # user: User.find_by(is_pro?: true),
    owner: User.all.sample,
  )
end 
=end

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


30.times do
  Invite.create!(
    invitee: User.all.sample,
    confirmed?: true,
    group: Group.all.sample,
    message: Faker::Marketing.buzzwords
  )
end

puts 'invitations CREATED...' 
puts "ALL DONE"