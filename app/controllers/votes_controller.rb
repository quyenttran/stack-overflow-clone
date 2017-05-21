before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

post '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  if @user
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
    end
  else
    # puts "??????????????????"
    # status 303
    # @errors = ["You need to be logged in and can only vote once for each question!"]
    # erb :"questions/show"
  end
end

post '/answers/:id/upvote' do
  @answer = Answer.find(params[:id])
  if @user
    vote = Vote.new( {value: 1, voter_id: @user.id, votable_id: @answer.id, votable_type: @answer.class.to_s})
    if @user && vote.save
      @vote_sum = @answer.vote_sum
      if request.xhr?
        status 200
        content_type :json
        { answer_id: @answer.id, votecount: @vote_sum}.to_json
      else
        redirect "/questions/#{@answer.question.id}"
      end
    end
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

post '/answers/:id/downvote' do

end

# get '/raise422' do
#     status 422
#     body 'You need to be logged in and can only vote once for each question!'
# end
