class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @books = @user.books
    unless @user == current_user.id
      redirect_to book_path(@user.id)
    end
  end

  def index
    @users = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end