class BooksController < ApplicationController

  def index
    @user = User.find(params[:id])

  end

  def edit

  end

    private

  def user_params
    params.require(:user).permit(:name)
  end



end
