class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
  end


  def destroy
  end

 private


  def book_params
    params.require(:book).permit(:title, :body)
  end



end
