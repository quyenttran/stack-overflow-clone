helpers do

  def show_votes_for(obj)
    erb :_votes, layout: false, locals: {votable: obj}
  end

end
