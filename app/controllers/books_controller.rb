class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @users = User.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to root_path
  end


  def show
  end

  def edit
  end
    private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
