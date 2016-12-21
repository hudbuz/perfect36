class UsersController < ApplicationController


  def index
    if authorize current_user
      @users = User.all.where('role < 2')
      
      respond_to do |f|
        f.html {render :index}
        f.json {render json: @users}
      end
    end

  end

  def show
    @user = User.find(params[:id])
  
    if @user == current_user
      @user = current_user
      respond_to do |format|
      format.html {render :show}
      format.json {render json: @user}
    end
    
   
   
    else
      if authorize User.find(params[:id])
        @user = User.find(params[:id])
        respond_to do |format|
      format.html {render :show}
      format.json {render json: @user}
    end

      
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