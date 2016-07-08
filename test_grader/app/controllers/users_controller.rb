class UsersController < ApplicationController


  def index
    if authorize current_user
      @users = User.all
    end

  end

  def show

    if User.find(params[:id]) == current_user
      @user = current_user
    else
      if authorize User.find(params[:id])
        @user = User.find(params[:id])
      end

  end
  end

end