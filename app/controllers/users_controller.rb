class UsersController < ApplicationController
  
# before_action :signed_in_user, only: [:index, :edit, :update]
# before_action :correct_user,   only: [:edit, :update]
  
  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.order('updated_at DESC')
  end

  def edit
    @user = User.find(params[:id])
    # @user == current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your user info has been successfully updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
  
end
