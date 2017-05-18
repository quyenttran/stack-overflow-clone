get '/answers' do
  @answers = Answer.all
  erb :_answers
end

get '/answers/new' do
  @answer = Answer.new
  erb :_new_answer
end
