# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

20.times do
    Wiki.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        private: false
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