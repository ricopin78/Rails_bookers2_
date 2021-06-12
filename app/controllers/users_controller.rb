class UsersController < ApplicationController

def after_sign_up_path_for(resource)
end

def after_sign_in_path_for(resource)
  user_path
end

before_action :authenticate_user!


  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def new

  end

  def edit
  end

    private

  def user_params
    params.require(:user).permit(:name)
  end


end
