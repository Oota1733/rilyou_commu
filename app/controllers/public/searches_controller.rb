class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    
    #@range = params[:range]
    @word = params[:word]
    #if @range == "Post"
    @posts = Post.looks(params[:search], params[:word])
    
    #else
    flash.now[:notice] = "見つかりませんでした。" unless @posts.any?

    #end
    render :index
  end

end
