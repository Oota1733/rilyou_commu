class Public::CommunitiesController < ApplicationController

    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]

    def new
      @community = Community.new
    end

    def index
      @community = Community.new
      @communities = Community.all
      @user = User.find(current_user.id)
    end

    def show
      @community = Community.find(params[:id])
      if params[:latest]
        @community_posts = @community.posts.order(created_at: :desc)
      elsif params[:old]
        @community_posts = @community.posts.order(created_at: :asc)
      else
        @community_posts = @community.posts
      end
      @tags = Post.all.map{|post| post.tag}.sort_by(&:id).uniq
    end

    def create
      @community = Community.new(community_params)
      @community.user_id = current_user.id
      if @community.save
        redirect_to communities_path
      else
        logger.debug @community.errors.full_messages
        render 'new'
      end
    end

    def update
      if @community.update(community_params)
        redirect_to communities_path
      else
        render "edit"
      end
    end

    def destroy
        @community = Community.find(params[:id])
        @community.destroy
        redirect_to communities_path
    end

    def genre_search
       @tag_id = params[:tag_id]
       @posts = Post.where(tag_id: @tag_id)
    end

    private

    def community_params
      params.require(:community).permit(:name, :introduction)
    end

    def ensure_correct_user
      @community = Community.find(params[:id])
      unless @community.user_id == current_user.id
        redirect_to community_path
      end
    end

end
