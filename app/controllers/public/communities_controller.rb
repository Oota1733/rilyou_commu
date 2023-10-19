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
      @tags = Tag.all
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
#ここだけ残す
    def destroy
        @community = Community.find(params[:id])
        @community.destroy
        redirect_to communities_path
    end

    # def show
    #     @tag = Tags.find(params[:id])
    #     @tag = Tags.all
    #     @paginate = @tags.items.page(params[:page]).per(12)
    # end

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
