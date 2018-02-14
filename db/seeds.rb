require 'faker'

puts "cleaning started"
User.destroy_all
Article.destroy_all
puts "cleaning finished"

puts "create me as admin user"
# user n°1 who is an admin
user = User.create(
  email: "reginalddewasseige@gmail.com",
  password: "password"
  )

# start faker
puts 'Creating DB through FAKER...'
15.times do(
  user = User.create(
    email: Faker::Internet.email,
    password: "password",
    )

  rand(1..20).times do (
    article = Article.create(
      title: Faker::Name.title,
      text: Faker::VForVendetta.quote,
      user_id: user.id,
      )
    )
  end

  )
end

puts 'Finished seeding DB!'
