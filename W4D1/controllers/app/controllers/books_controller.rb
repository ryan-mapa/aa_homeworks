class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  # def show
  #   book = Book.find_by(:id params[:id])
  #   render json: book
  # end

  def create
    book = Book.new(book_params)
    if book.save
      redirect_to books_url
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
  end

  # def create
  #   book = Book.new(book_params)
  #   if book.save
  #     render json: book
  #     redirect_to books_url
  #   else
  #     render json: book.errors.full_messages, status: :unprocessable_entity
  #   end
  # end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
