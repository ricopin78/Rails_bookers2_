class UsersController < ApplicationController

before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user

  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new

  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "successfully Updated."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
    @book = Book.new
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end