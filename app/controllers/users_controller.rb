class UsersController < ApplicationController

before_action :authenticate_user!

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @book_id = Book.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user.id), success: 'Successfully Updated.'
    else
      render :edit
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end