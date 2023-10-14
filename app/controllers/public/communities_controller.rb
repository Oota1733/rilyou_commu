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
      # @community = Community.new
      @community = Community.find(params[:id])
      # @communities = Community.all
      # @posts = Post.all
      #byebug
      #@user = User.find(params[:id])
      # @user = @community.user
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
