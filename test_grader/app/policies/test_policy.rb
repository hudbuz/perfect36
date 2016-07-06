class TestPolicy < ApplicationPolicy

  def new?
    user.normal?


  end
  def create?
    user.normal?
  end

  def show?
  
    user.admin? || user.owner_of?(test)

  def edit?

    user.admin? || user.owner?(test)
  end




end