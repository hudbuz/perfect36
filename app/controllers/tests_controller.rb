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
    @user = current_user
    @available = @user.taken_test?
    @test = Test.new(user_id: params[:user_id])
    @test.responses.build
    @format = Test.format



    end

  end

  def create


    @test = Test.create(test_params)

    @test.responses_attributes=params["test"]["responses_attributes"]


    @test.status = 'complete'
    @test.save
    @test.grade_test
    render json: @test, include: ["responses"], status: 201
    redirect_to user_test_path(current_user, @test)

  end

  def show

    @test = Test.find(params[:id])

    if authorize @test
     # @test = Test.includes(:responses).where(id: params[:id], user_id: params[:user_id]).first


      @answerkey = @test.answer_key
      @sections = @answerkey.sections
      @answers = @answerkey.answers
      @code = @answerkey.code
      respond_to do |format|
      format.html {render :show}

      format.json {render json: @test, include: ["responses"]}
    end
    end

  end





  def test_params

    params.require(:test).permit(:answer_key_id, :user_id, responses_attributes: [])
  end



end
