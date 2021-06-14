class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @book_id = Book.find(params[:id])
    @book = Book.new
    @books = Book.all
    @user = current_user.id
  end


  def destroy
    @book_id = Book.find(params[:id])
    @book_id.destroy
    redirect_to users_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to users_path
  end

 private


  def book_params
    params.require(:book).permit(:title, :body)
  end



end
