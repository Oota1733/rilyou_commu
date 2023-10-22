class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search

    @word = params[:word]
    @title = params[:title]
    @posts = Post.looks(params[:search], params[:word])

    flash.now[:notice] = "見つかりませんでした。" unless @posts.any?

    render :index
  end

end
