class Public::CommentsController < ApplicationController
  
  def create
   
    comment = current_user.comments.new(comment_params)
    comment.save
    redirect_back(fallback_location: root_path)
    # redirect_to post_image_path(post_image)
  end

  private

  def comment_params
     params.require(:comment).permit(:comment)
  end
end
