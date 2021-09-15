require 'csv'
require 'open-uri'
require 'nokogiri'
puts "Resetting database"
Message.destroy_all
Chatroom.destroy_all
Invite.destroy_all
Group.destroy_all
Review.destroy_all
Event.destroy_all
Place.destroy_all
User.destroy_all



Faker::Config.locale 

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = 'app/assets/csv/open_pub.csv'
userfilepath = 'app/assets/csv/random_london.csv'

#####Cloudinary pics###########
users_urls = [
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/people/photo-1592621385612-4d7129426394_tkosxs.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480266/onetwothree/people/photo-1568054043324-86c349f926d0_wfub78.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480266/onetwothree/people/photo-1507591064344-4c6ce005b128_qvelwc.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480266/onetwothree/people/photo-1468218457742-ee484fe2fe4c_qm4qjd.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480266/onetwothree/people/photo-1504257432389-52343af06ae3_k7sph3.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480266/onetwothree/people/photo-1500648767791-00dcc994a43e_recfts.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480266/onetwothree/people/photo-1523419409543-a5e549c1faa8_umq8ii.jpg"
]
events_urls = [
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480268/onetwothree/events/photo-1627985683059-ad3d0a500b9b_hoam4j.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480268/onetwothree/events/photo-1575449235878-6de79c4c8ef4_lwedfw.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/events/photo-1575448913281-98e9e5d3f193_mem89s.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/events/photo-1570773455183-e95ad040b034_fe6zca.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/events/photo-1507539989371-99615e449486_pbhjrc.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/events/photo-1511804630215-682f94fde271_gz45q8.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/events/photo-1504609813442-a8924e83f76e_h2dwnw.jpg"
]
places_urls = [
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/places/photo-1621618658133-5c496b2fe4b0_mj5w8d.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/places/photo-1571838657342-9ef1b10d2ce3_ovvqug.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/places/photo-1579708776106-eeb62aa0af7b_ytdugd.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/places/photo-1436018626274-89acd1d6ec9d_dwyrri.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/places/photo-1569924995012-c4c706bfcd51_p4f8lz.jpg",
  "https://res.cloudinary.com/duxof8o3p/image/upload/v1631480267/onetwothree/places/photo-1589459985166-966c72e767d9_afykqq.jpg"
]
# user_photo = URI.open(users_urls.sample)
# # user.photo.attach(io: user_photo, filename: 'photo.jpg')
# event_photo = URI.open(events_urls.sample)
# event.photo.attach(io: event_photo, filename: 'photo.jpg')
# place_photo = URI.open(places_urls.sample)
# place.photo.attach(io: place_photo, filename: 'photo.jpg')

dancing_styles = ["Cuban Style", "Puerto Rican Style", "Casino Rueda", "LA Style", "New YorkStyle"]
puts 'Creating 1 test user... pass testing'

user = User.create!(
  email: "testing@testing.com",
  username: "testing",
  password: "testing",
  is_pro?: true,
  role: ["leader", "follower", "lead/follower"].sample,
  status: "I really want to dance now!",
  style: dancing_styles.sample
  )
  user_photo = URI.open(users_urls.sample)
  user.photo.attach(io: user_photo, filename: 'photo.jpg')
puts 'TEST users created!'
puts 'Creating the boys'
puts 'first up! ervis'
ervis = User.create!(
  email: Faker::Internet.email,
  username: "Ervis lapis",
  password: "testing",
  is_pro?: true,
  role: "leader/follower",
  address: "169 Hoxton St, London N1 6PG",
  status: "I really want to dance now!",
  style: dancing_styles.sample
)
ervis.photo.attach(io: File.open('app/assets/images/ervis.jpg'), filename: 'ervis.jpg')
rand(3..7).times do
  review = Review.create!(
  rating: rand(1..5),
  content: Faker::Movie.quote,
  receiver: ervis,
  user: User.all.sample,
  )
end
puts "ervis is in the building"
puts 'Next up! Mike'
mike = User.create!(
  email: Faker::Internet.email,
  username: "Mike Drop",
  password: "testing",
  is_pro?: true,
  role: "leader/follower",
  address: "London E2 8DY",
  status: "vamos a bailar",
  style: dancing_styles.sample
)
mike.photo.attach(io: File.open('app/assets/images/mike.jpg'), filename: 'mike.jpg')
rand(3..7).times do
  review = Review.create!(
  rating: rand(1..5),
  content: Faker::Movie.quote,
  receiver: mike,
  user: User.all.sample,
  )
end
puts "mike is in the building"
puts "Jacek the big dawg!"
Jacek = User.create!(
  email: Faker::Internet.email,
  username: "Jacek",
  password: "testing",
  is_pro?: false,
  role: "leader/follower",
  address: "Haggerston Rd, London",
  status: "Looking forward to my first dance",
  style: dancing_styles.sample
)
Jacek.photo.attach(io: File.open('app/assets/images/jacek.jpg'), filename: 'jacek.jpg')

puts "The big dawg is in the building woof woof"
puts "introducing dave"
dave = User.create!(
  email: Faker::Internet.email,
  username: "david",
  password: "testing",
  is_pro?: true,
  role: "follower",
  address: "138 Kingsland Rd, London E2 8DY",
  status: "I'm free all week",
  style: dancing_styles.sample
)
dave.photo.attach(io: File.open('app/assets/images/dave.png'), filename: 'dave.png')
rand(3..7).times do
  review = Review.create!(
  rating: rand(1..5),
  content: Faker::Movie.quote,
  receiver: dave,
  user: User.all.sample,
  )
end
puts "dave is in the building"
puts 'Creating 10 fake users...'

CSV.foreach(userfilepath, csv_options).with_index do |row, index|
  puts "creating user number #{index}"
  break if index == 3
    user = User.create!(
      email: Faker::Internet.email,
      username: Faker::Internet.username,
      password: "testing",
      is_pro?: [true, false].sample,
      role: ["leader", "follower", "leader/follower"].sample,
      address: row['address'],
      status: "I really want to dance now!",
      style: dancing_styles.sample
    )
    user_photo = URI.open(users_urls.sample)
    user.photo.attach(io: user_photo, filename: 'photo.jpg')

    rand(3..7).times do
      review = Review.create!(
      rating: rand(1..5),
      content: Faker::Movie.quote,
      receiver: user,
      user: User.all.sample,
      )
    end
end
puts '10 users created!'


puts 'Creating 15 places...'


CSV.foreach(filepath, csv_options).with_index do |row, index|
    puts "creating place number #{index}"
    break if index == 5
    place = Place.create!(
    name: row['name'],
    address: "#{row['address']}, London",
    latitude: row['latitude'].to_f,
    longitude: row['longitude'].to_f, 
    # user: User.find_by(is_pro?: true),
    owner: User.all.sample,
  )
  place_photo = URI.open(places_urls.sample)
  place.photo.attach(io: place_photo, filename: 'photo.jpg')
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
  event = Event.create!(
    name: Faker::Music::Opera.rossini,
    event_type: ["Lesson", "Event"].sample,
    host: User.all.sample,
    place: Place.all.sample,
    start_time: rand(1..100).days.from_now
  )
  event_photo = URI.open(events_urls.sample)
  event.photo.attach(io: event_photo, filename: 'photo.jpg')
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


20.times do
  Invite.create!(
    invitee: User.all.sample,
    confirmed?: true,
    group: Group.all.sample,
    message: Faker::Marketing.buzzwords
  )
end

puts 'invitations CREATED...' 
puts "ALL DONE"