class TestsController < ApplicationController

  def index
     if params[:user_id]

      @tests = User.find(params[:user_id]).tests.where(status: 'complete').uniq
      @user = User.find(params[:user_id])
     
    else
      @tests = Test.all
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
    @test = Test.new(user_id: params[:user_id])
    @test.answers.build
    @format = Test.format
    end
    
  end

  def create

    @test = Test.create(test_params)
    
    @test.status = 'complete'
    @test.save
    redirect_to test_path(@test)

  end

  def show
    
    if params[:user_id]
      @test = User.find(params[:user_id]).tests.find(params[:id])
      binding.pry
    else
      @test = Test.find(params[:id])
    end

    

  end

  

  def test_params

    params.require(:test).permit(:answer_key_id, :user_id, responses_attributes: [:answer_choice])
  end



end