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
  @answer = Answer.create!(params[:answer])
  if request.xhr?
    content_type :json
    {question_id: @answer.question_id, answer: @answer.answer}.to_json
  else
    redirect "/questions/#{@answer.question_id}"
  end
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

