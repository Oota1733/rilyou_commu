class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
  end

  def index
    @posts = Post.all
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to Community.find(params[:community_id])
  end



  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_id, :public_status)
  end
end
