class Public::PostsController < ApplicationController

  def new
      @post = Post.new
  end

  def edit
  end

  def update
      if @post.update(post_params)
        redirect_to posts_path
      else
        render "edit"
      end
  end

  def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id

      if @post.save
        redirect_to community_index_path
      else
        render 'new'
      end
    end

    def post_params
      params.require(:post).permit(:name, :introduction)
    end
end
