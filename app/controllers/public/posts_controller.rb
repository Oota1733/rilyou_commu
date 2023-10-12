class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    # if @post.update(post_params)
    #   redirect_to posts_path
    # else
    #   render "edit"
    # end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.community_id = params[:community_id]

    if @post.save
      redirect_to community_path(params[:community_id])
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_id, :public_status)
  end
end
