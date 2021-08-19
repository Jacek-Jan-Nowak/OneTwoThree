puts "Resetting database"
User.destroy_all



puts 'Creating 1 test user... pass testing'

User.create!(
  email: "testing@testing.com",
  username: "testing",
  password: "testing"
)
puts 'TEST users created!'

puts 'Creating 10 fake users...'

10.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    password: "testing"
  )
end

puts 'Fake users created!'