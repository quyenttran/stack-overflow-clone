require 'byebug'
helpers do

  def show_comments_for(obj)
    erb :_comments, layout: false, locals: {commentable: obj}
  end

  def show_comment_form_for(obj)
    erb :_comment_form, layout: false, locals: {commentable: obj}
  end

  def new_comment_url(commentable)
    if commentable.class == Question
      "/questions/#{commentable.id}/comments"
    elsif commentable.class == Answer
      "/questions/#{commentable.question.id}/answers/#{commentable.id}/comments"
    end
  end

end
