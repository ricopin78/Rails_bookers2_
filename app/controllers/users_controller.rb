class UsersController < ApplicationController

before_action :authenticate_user!


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])

  end
  
  
  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end



end
