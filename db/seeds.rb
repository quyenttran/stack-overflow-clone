require 'faker'

10.times do
  # Generate a fake user
  username = Faker::Internet.user_name
  email = Faker::Internet.safe_email
  user = User.create(username: username, email: email, password: 'password')
  # Have fake user ask 3 questions
  3.times do
    question = Faker::Lorem.paragraphs(2).join('')
    Question.create(question: question, questioner_id: user.id)
  end
end

# For each question, generate 3 answers
Question.all.each do |question|
  2.times do
  # Choose a random user to provide the answer
  user = User.where.not(id: question.questioner_id).sample
  answer = Faker::Lorem.paragraphs(2).join('')
  Answer.create(answer: answer, answerer_id: user.id, question_id: question.id)
  end
end
