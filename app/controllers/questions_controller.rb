before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.view_count += 1
  @answers = Answer.where(question_id: @question.id)
  erb :'/questions/show'
end
