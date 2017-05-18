get '/questions/:id/answers/:answer_id' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/show'
end
