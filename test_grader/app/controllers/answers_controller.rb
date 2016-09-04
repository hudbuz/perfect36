class AnswersController < ApplicationController



  def index
   
    @section = Section.find_by(title: answer_params[:section], answer_key_id: answer_params[:akey])
    @answer = Answer.find_by(section: @section, question: answer_params[:question])
    render json: @answer
   
    


  end

  private

  def answer_params
    params.permit(:question, :section, :akey)

  end


end