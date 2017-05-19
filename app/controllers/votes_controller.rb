post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  @question.votes << Vote.create({value: 1})
  if request.xhr?
    status 200
    content_type :json
    { question_id: @question.id, votecount: @question.votes.count }.to_json
  else
  redirect "/questions/#{@question.id}"
  end
end

delete '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  last_vote = @question.votes.last
  @question.votes.delete(last_vote)
   if request.xhr?
    status 200
    content_type :json
    { question_id: @question.id, votecount: @question.votes.count }.to_json
  else
  redirect "/questions/#{@question.id}"
  end
end

