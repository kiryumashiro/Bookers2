class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:create] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end


  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    @user = @book.user
    unless @user.id == current_user.id
      redirect_to book_path(@book.id)
    end
    flash[:update] = "You have updated book successfully."
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end
    private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
