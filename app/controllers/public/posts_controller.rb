class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
       redirect_to community_path(params[:community_id])
     else
       render "edit"
     end
  end

  def create
    @post = Post.new(post_params)
    @post.community_id = params[:community_id]
    @post.user_id = current_user.id

    if @post.save
      redirect_to community_path(params[:community_id])
    else

      logger.debug @post.errors.full_messages
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id)
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
