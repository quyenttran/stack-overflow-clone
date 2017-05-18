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
  question = Question.new(params[:question])
  "#{question}"
  # if current_user.questions << question
  # else
  # end
end
