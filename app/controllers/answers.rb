get '/answers' do
  @answer = Answer.first
  erb :_answers
end
