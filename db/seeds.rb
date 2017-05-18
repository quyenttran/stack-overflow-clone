require 'faker'

4.times do |person|
	User.create(username: Faker::LordOfTheRings.character, email: Faker::Internet.safe_email, password: "123")
end

question = {
  title: "Twitter Bootstrap - add top space between rows
", question: "How to add margin top to class=\"row\" elements using twitter bootstrap framework?", user_id: 1
}

Question.create(question)

