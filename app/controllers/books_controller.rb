class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @book_id = Book.find(params[:id])
    @book = Book.new
    @books = Book.current_user
    @user = User.find(params[:id])
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

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
