class TestsController < ApplicationController

  def index
    
     if current_user

      @tests = current_user.tests.where(status: 'complete').uniq
      @user = User.find(params[:user_id])
     
    else
      redirect_to login_path, alert: "You must be logged in to perform that action."
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
    @test = Test.new(user_id: params[:user_id])
    @test.responses.build
    @format = Test.format
    end
    
  end

  def create

    @test = Test.create(test_params)
    
    @test.status = 'complete'
    @test.save
    redirect_to user_test_path(current_user, @test)

  end

  def show

    @test = Test.find(params[:id])
    if authorize @test
      @test = Test.includes(:responses).where(id: params[:id], user_id: params[:user_id]).first
    

      @answerkey = @test.answer_key
      @sections = @answerkey.sections
      @answers = @answerkey.answers
      @code = @answerkey.code
     
      binding.pry
    
      
    end

    

  end

  

  def test_params

    params.require(:test).permit(:answer_key_id, :user_id, responses_attributes: [:answer_choice])
  end



end