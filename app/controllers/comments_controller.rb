before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

post '/questions/:id/comments' do
  @comment = Comment.new(params[:comment])
  @question = Question.find(params[:id])
  if request.xhr?
    if @question.comments << @comment
      "<li>#{@comment.comment}</li>"
    end
  else
    puts "Error!"
    erb :'questions/show'
  end
end

post '/questions/:question_id/answers/:id/comments' do
  @comment = Comment.new(params[:comment])
  @answer = Answer.find(params[:id])
  if request.xhr?
    if @answer.comments << @comment
      "<li>#{@comment.comment}</li>"
    end
  else
    puts "Error!"
    erb :'questions/show'
  end
end

