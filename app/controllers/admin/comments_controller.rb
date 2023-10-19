class Admin::CommentsController < ApplicationController


  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to admin_post_path(@post)
  end
end
