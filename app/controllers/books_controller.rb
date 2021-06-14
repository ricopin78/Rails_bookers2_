class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to user_path(current_user.id)
  end

  def show
    @book = Book.find(params[:id])
  end


  def destroy
  end

 private


  def book_params
    params.require(:book).permit(:title, :body)
  end



end
