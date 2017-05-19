before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  vote = Vote.new({value: 1, voter_id: @user.id, votable_id: @question.id, votable_type: @question.class.to_s})
  if @user && vote.save
    @vote_sum = @question.vote_sum
    if request.xhr?
      status 200
      content_type :json
      { question_id: @question.id, votecount: @vote_sum }.to_json
    else
      redirect "/questions/#{@question.id}"
    end
  else
    #render error to user to log in or something
    redirect "/"
  end
end

post '/questions/:id/downvote' do
  @question = Question.find(params[:id])
  vote = Vote.new({value: (-1), voter_id: @user.id, votable_id: @question.id, votable_type: @question.class.to_s})
  if @user && vote.save
    @vote_sum = @question.vote_sum
    if request.xhr?
    status 200
    content_type :json
    { question_id: @question.id, votecount: @vote_sum }.to_json
    else
    redirect "/questions/#{@question.id}"
    end
  end
end

