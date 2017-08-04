require 'random_data'

# Create Wikis
20.times do
  Wiki.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
wikis = Wiki.all

# Create users
5.times do
  User.create!(
  #username:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

# Create standard user
standard = User.create!(
  #username:     'Standard User',
  email:    'standard@example.com',
  password: 'helloworld',
)
standard.skip_confirmation!
standard.save!

# Create premium user
premium = User.create!(
  #username:     'Premium User',
  email:    'premium@example.com',
  password: 'helloworld',
  role:     'premium'
)
premium.skip_confirmation!
premium.save!

# Create admin user
admin = User.create!(
  username: 'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

puts "Seed finished"
puts "{Wiki.count} wikis created"
puts "{User.count} users created"