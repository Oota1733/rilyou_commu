class Public::TagsController < ApplicationController
  def show
    @tags = Tag.all
  
    @posts = []
    @tags.each do |tag|
      @posts << tag.posts
    end
    @posts = @posts.flatten
  end
end
