class UsersController < ApplicationController
  
  # before_action :is_matching_login_user, only: [:edit, :update]
  
  def index
     @user = User.new
     @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    @book = current_user.book.update
  end
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
  
end
