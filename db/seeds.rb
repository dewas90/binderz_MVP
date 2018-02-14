require 'faker'

puts "cleaning started"
User.destroy_all
Article.destroy_all
puts "cleaning finished"

puts "start creating users"
# user n°1 who is an admin
user = User.create(
  email: "reginalddewasseige@gmail.com",
  password: "password"
  )

# faker

puts 'Creating db through FAKER...'
100.times do (
  article = Article.create(
    title: Faker::Name.title,
    text: Faker::VForVendetta.quote
    )
  # Article.find(Article.last).update_column(:text_hash, AcctTransaction.last.adjusted_bal)
  )
end

puts 'Finished seeding db!'
