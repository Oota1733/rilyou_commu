class Public::CommunityController < ApplicationController
  
    before_action :authenticate_user!
    before_action :ensure_correct_user, only: [:edit, :update]
  
    def index
      @post = Post.new
      @communities = Community.all
      @user = User.find(current_user.id)
    end
  
    def show
      @post = Post.new
      @group = Community.find(params[:id])
      @user = User.find(params[:id])
    end
  
    def new
      @community = Community.new
    end
  
    def create
      @community = Community.new(group_params)
      @community.owner_id = current_user.id
      if @community.save
        redirect_to community_index_path, method: :post
      else
        render 'new'
      end
    end
  
    def edit
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
      params.require(:community).permit(:name, :introduction, :community_image)
    end
  
    def ensure_correct_user
      @community = Community.find(params[:id])
      unless @community.owner_id == current_user.id
        redirect_to community_path
      end
    end
  
end
