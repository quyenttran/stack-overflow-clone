before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

post '/questions/:id/comments' do
  @comment = Comment.new(params[:comment])
  @question = Question.find(params[:id])
  if @question.comments << @comment
    redirect "/questions/#{@question.id}"
  end
end

post '/questions/:question_id/answers/:id/comments' do
  @comment = Comment.new(params[:comment])
  @answer = Answer.find(params[:id])
  if @answer.comments << @comment
    redirect "/questions/#{params[:question_id]}"
  end
end

