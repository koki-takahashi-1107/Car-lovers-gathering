class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!

  def top
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    @post_image = PostImage.new
    @tag_list = Tag.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
    render "edit"
  end

   def update
     @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to admin_post_image_path(@post_image), notice: "内容更新しました。"
    else
      render "edit"
    end
   end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admin_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :description)
  end
end