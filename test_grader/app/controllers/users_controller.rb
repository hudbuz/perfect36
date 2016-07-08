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

end