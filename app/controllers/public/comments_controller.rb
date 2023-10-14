class Public::CommentsController < ApplicationController

  # def create

  #   comment = current_user.comments.new(comment_params)
  #   comment.save
  #   redirect_back(fallback_location: root_path)
  #   # redirect_to post_image_path(post_image)
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save
    redirect_to community_post_path(@post.community, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comments = @post.comments
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to community_post_path(@post.community, @post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
