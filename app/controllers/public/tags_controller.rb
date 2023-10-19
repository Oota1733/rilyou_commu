class Public::TagsController < ApplicationController
  def show

    @tag = Tag.find(params[:id])
    @posts = @tag.posts
  #   @tags.each do |tag|
  #     @posts << tag.posts
  #   end
  #   @posts = @posts.flatten
  end
end
