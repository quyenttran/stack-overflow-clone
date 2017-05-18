before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

get '/answers' do
  @answers = Answer.all
  erb :_answers
end

get '/questions/:id/answers/new' do
  @answer = Answer.new
  @question = Question.find(params[:id])
  erb :_new_answer
end

post '/answers' do
  puts "\n\n"
  puts params
  @answer = Answer.create!(params[:answer])

  redirect "/questions/#{@answer.question_id}"
end
