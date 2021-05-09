class Users::UsersController < ApplicationController
   before_action :authenticate_user!
   before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
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


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
