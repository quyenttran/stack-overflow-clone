post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @question.votes << Vote.create({value: 1})
  redirect "/questions/#{@question.id}"
end

delete '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  last_vote = @question.votes.last
  @question.votes.delete(last_vote)
  redirect "/questions/#{@question.id}"
end
