get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.view_count += 1
  erb :'/questions/show'
end
