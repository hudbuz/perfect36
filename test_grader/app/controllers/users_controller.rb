class UsersController < ApplicationController


  def index
    if authorize current_user
      @users = User.all
    end

  end

  def show

    if User.find(params[:id]) == current_user
      @user = current_user
      @test = Test.new
   
    else
      if authorize User.find(params[:id])
        @user = User.find(params[:id])
      
      end

  end
  @answerkeys = AnswerKey.all
  end

  def update
    authorize current_user
    binding.pry
    @user = User.find(params[:user_id])
    @user.update(role: 1)
    redirect_to user_path(current_user)
  end

end