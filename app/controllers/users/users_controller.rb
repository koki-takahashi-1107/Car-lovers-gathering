class Users::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @post_image = PostImage.new
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
   if @user == current_user
    render "edit"
   else
    redirect_to user_path(current_user)
   end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end


end
