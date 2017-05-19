require 'faker'

# User.delete_all
# Question.delete_all
# Answer.delete_all
# Comment.delete_all
# Vote.delete_all

# 50.times do
#   User.create!(
#     :username => Faker::LordOfTheRings.character,
#     :email => Faker::Internet.email,
#     :password => '123'
#     )
# end

# questions = 20.times.map do
#   Question.create!(
#     :title => Faker::Hacker.say_something_smart,
#     :question => Faker::Hacker.say_something_smart,
#     :user_id => rand(1..50),
#     )
# end



# answers = 20.times.map do
#   Answer.create!(
#     :answer => Faker::Hacker.say_something_smart,
#     :user_id => rand(1..50),
#     :question_id => rand(1..20)
#     )
# end

# question_comments = 20.times.map do
#   Comment.create!(
#     :comment => Faker::Hacker.say_something_smart)
# end

# answer_comments = 20.times.map do
#   Comment.create!(
#     :comment => Faker::Hacker.say_something_smart)
# end

# question_comments.each do |comment|
#   random_questions = questions.sample(rand(2..5))
#   random_questions.each do |question|
#     question.comments << comment
#   end
# end

# answer_comments.each do |comment|
#   random_answers = answers.sample(rand(2..5))
#   random_answers.each do |answer|
#     answer.comments << comment
#   end
# end

answers = [
  {
    answer: "I don't know how I could have made it any clearer",
    user_id: 1,
    question_id: 1
  },
  {
    answer: "I don't know how I could have made it any clearer",
    user_id: 1,
    question_id: 2
  },
  {
    answer: "I don't know how I could have made it any clearer",
    user_id: 1,
    question_id: 3
  },
  {
    answer: "I don't know how I could have made it any clearer",
    user_id: 1,
    question_id: 4
  },
  {
    answer: "Did you even read the question?!",
    user_id: 2,
    question_id: 1
  },
  {
    answer: "Did you even read the question?!",
    user_id: 2,
    question_id: 2
  },
  {
    answer: "Did you even read the question?!",
    user_id: 2,
    question_id: 3
  },
  {
    answer: "Did you even read the question?!",
    user_id: 2,
    question_id: 4
  },
  {
    answer: "Turn it off and turn it back on",
    user_id: 3,
    question_id: 1
  },
  {
    answer: "Turn it off and turn it back on",
    user_id: 3,
    question_id: 2
  },
  {
    answer: "Turn it off and turn it back on",
    user_id: 3,
    question_id: 3
  },
  {
    answer: "Turn it off and turn it back on",
    user_id: 3,
    question_id: 4
  },
  {
    answer: "It's handled",
    user_id: 4,
    question_id: 1
  },
  {
    answer: "It's handled",
    user_id: 4,
    question_id: 2
  },
  {
    answer: "It's handled",
    user_id: 4,
    question_id: 3
  },
  {
    answer: "It's handled",
    user_id: 4,
    question_id: 4
  }
]

Answer.create!(answers)

4.times do |person|
	User.create(username: Faker::LordOfTheRings.character, email: Faker::Internet.safe_email, password: "123")
end

questions = [
  {
    title: "Twitter Bootstrap - add top space between rows",
    question: "How to add margin top to class=\"row\" elements using twitter bootstrap framework?",
    user_id: 1
  },
  {
    title: "How do I get to the mainframe?",
    question: "I'm stuck in the matrix",
    user_id: 1
  }
]

Question.create(questions)

comments = [
  {
    comment: "Test, test, test, this is a test",
    commentable_id: 1,
    commentable_type: 'Question'
  },
  {
    comment: "Hey, how do you re-record on these things?",
    commentable_id: 1,
    commentable_type: 'Answer'
  },
  {
    comment: "I hate your question",
    commentable_id: 2,
    commentable_type: 'Question'
  },
  {
    comment: "I love your answer",
    commentable_id: 2,
    commentable_type: 'Answer'
  }
]

Comment.create!(comments)
