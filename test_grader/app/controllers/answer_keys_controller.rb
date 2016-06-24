class AnswerKeysController < ApplicationController

  def index
     if params[:user_id]

      @tests = AnswerKey.all
     
    else
      redirect_to tests_path
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
    @test = AnswerKey.new
    @test.answers.build
    @format = AnswerKey.format
    end
    
  end

  def create
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to users_path, alert: "User not found."
    else
    @test = AnswerKey.create(answer_key_params)
    @test.save
    
    redirect_to tests_path
    end
  end

  

    

  

  

  def answer_key_params

    params.require(:answer_key).permit( :code, :url,  answers_attributes: [:correct_answer])
  end



end