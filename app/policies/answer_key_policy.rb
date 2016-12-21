class AnswerKeyPolicy < ApplicationPolicy

  def new?
    user.admin?


  end
  def create?
    user.admin?
  end

  def edit?

    user.admin?
  end




end