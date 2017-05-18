get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.view_count += 1
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb:"/questions/edit"
end

post '/questions' do
  #using current_user helper method but hardcoded
  user = User.find_by(id: 5)
  question = Question.new(params[:question])
  # if current_user.questions << question
  if user.questions << question
     redirect "/users/#{user.id}/profile"
  else
     "Error"
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end
