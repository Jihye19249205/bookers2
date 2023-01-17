class BooksController < ApplicationController
  
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to books_path
    # else
    #   render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    # @book = Book.find(params[:id])
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end