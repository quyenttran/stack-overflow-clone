helpers do

  def show_comments_for(obj)
    erb :_comments, layout: false, locals: {commentable: obj}
  end

end
