before do
  if logged_in?
    @user = User.find(session[:id])
    # session[:upvote_question_ids] = []
  end
end

post '/questions/:id/upvote' do
  # if @user.id == session[:id]
  @question = Question.find(params[:id])
  # if session[:upvote_question_ids].include?(@question.id)
  #   #ERRRor
  # else
  #  session[:upvote_question_id] << @question.id
  @question.votes << Vote.create({value: 1})
  if request.xhr?
    status 200
    content_type :json
    { question_id: @question.id, votecount: @question.votes.count }.to_json
  else
  redirect "/questions/#{@question.id}"
  end
  # end
end

delete '/questions/:id/downvote' do
  # if @user.id == session[:id]
  @question = Question.find(params[:id])
  last_vote = @question.votes.last
  if !last_vote.nil?
  @question.votes.delete(last_vote)
   if request.xhr?
    status 200
    content_type :json
    { question_id: @question.id, votecount: @question.votes.count }.to_json
  else
  redirect "/questions/#{@question.id}"
  end
end
# end
end

