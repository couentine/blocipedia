require 'random_data'

5.times do
    user = User.create!(
        username: Faker::StarWars.character,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end

users = User.all   

10.times do
    wiki = Wiki.create!(
        user: users.sample,
        title: Faker::StarWars.specie,
        body: Faker::StarWars.quote,
        private: Faker::Boolean.boolean
    )
end

wikis = Wiki.all


member = User.create!(
    email: 'member@example.com',
    password: 'password',
)

premium = User.create!(
    email: 'premium@example.com',
    password: 'password',
    role: 'premium'
)

admin = User.create!(
    email: 'admin@example.com',
    password: 'password',
    role: 'admin'
)

puts "Seed finished"
puts "#{Wiki.count} Wikis created"
puts "#{User.count} Users created"
