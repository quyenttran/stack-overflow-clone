before do
  if logged_in?
    @user = User.find(session[:id])
  end
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

post '/questions/:id/answers/:id/comments/new' do
  puts "/n/n"
  puts params
  @comment = Comment.new(params[:comment])
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:id])
  if @answer.comments << @comment
    redirect "/questions/#{@question.id}"
  end
end

