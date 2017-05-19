before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

# get '/comments' do  #########################
#   @comment = Comment.all
#   erb :_comment  ##########################
# end

post '/questions/:id/comments/new' do
    puts "\n\n"
  puts params
  @comment = Comment.create!(params[:comment])
  @question = Question.find(params[:question_id])
  @question.comments << @comment
  redirect "/questions/#{@question.id}"
end

post '/comments' do  ####################
  puts "\n\n"
  puts params
  @comment = Comment.create!(params[:comment])

  redirect "/questions/#{@comment.question_id}"
end
