class Public::TagsController < ApplicationController
  before_action :authenticate_user!
  def show

    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  #   @tags.each do |tag|
  #     @posts << tag.posts
  #   end
  #   @posts = @posts.flatten
  end
end
