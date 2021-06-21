class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Successfully Created."
      redirect_to book_path(@book.id)
    else
      render :index
    end

  end

  def show
    @book_id = Book.find(params[:id])
    @book = Book.new
  end


  def destroy
    @book_id = Book.find(params[:id])
    @book_id.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
      flash[:notice] = "Successfully Updated."
      redirect_to book_path(@book.id)
    else
      render :index
    end

  end

 private


  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
