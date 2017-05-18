require 'faker'

4.times do |person|
	User.create(username: Faker::LordOfTheRings.character, email: Faker::Internet.safe_email, password: "123")
end