class Users::PostImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def new
  end

  def show
    @post_images = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @post_images = PostImage.all
    @post_image = PostImage.new
  end

  def edit
  end
  

  def create
  end


  def destroy
  end

end
