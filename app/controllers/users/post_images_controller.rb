class Users::PostImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    tag_list = params[:post_image][:tag_name].split(nil)  
    if @post_image.save
       @post_image.save_tag(tag_list)
      redirect_to post_images_path
    else
      render :new
    end
  end

  def show
    @post_image = PostImage.find(params[:id]) #クリックした投稿を習得
    @post_comment = PostComment.new
    @post_tags = @post_image.tags 
  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    @post_image = PostImage.new
    @tag_list = Tag.all                          #ビューでタグ一覧を表示するために全取得。
    #@post_image = current_user.post_images.new   #ビューのform_withのmodelに使う。
  end

  def edit
     @post_image = PostImage.find(params[:id])
     @users = current_user
     if @post_image.user == current_user
      render "edit"
     else
      redirect_to post_images_path
     end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end


  private
  def post_image_params
    params.require(:post_image).permit(:title, :image, :description, :content)
  end

  def ensure_correct_user
    @post_image = PostImage.find(params[:id])
    unless @post_image.user == current_user
      redirect_to post_images_path
    end
  end
  
end
