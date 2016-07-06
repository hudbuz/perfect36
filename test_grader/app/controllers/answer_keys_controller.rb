class AnswerKeysController < ApplicationController

  def index
     if current_user

      @tests = AnswerKey.all
     
    else
      redirect_to tests_path
    end
  end

  def new
    
    @test = AnswerKey.new
    if authorize @test
      @test.answers.build
      @format = AnswerKey.format
    else
      redirect_to user_path(current_user), alert: "You don't have permission to create tests."
    end
    
  end

  def create
    
    @test = AnswerKey.new
    if authorize @test
    @test.update(answer_key_params)
    @test.save
    
    redirect_to tests_path
    end
  end

  

    

  

  

  def answer_key_params

    params.require(:answer_key).permit( :code, :url,  answers_attributes: [:correct_answer])
  end



end