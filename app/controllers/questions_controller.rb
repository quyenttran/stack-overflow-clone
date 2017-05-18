get '/questions/:id' do
  ################
  if logged_in?
    @user = User.find(session[:id])
  end
  ################

  @question = Question.find(params[:id])
  @question.view_count += 1
  @answers = Answer.where(question_id: @question.id)
  erb :'/questions/show'
end
