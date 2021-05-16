class Admin::PostImagesController < ApplicationController

  def top
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    @post_image = PostImage.new
    @tag_list = Tag.all
  end
end
