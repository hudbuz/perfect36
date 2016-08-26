class TestPolicy < ApplicationPolicy

  def new?
    user.normal?


  end
  def create?
    user.normal?
  end

  def show?
    
   user.admin? || user.id == record.user_id
   end

  def edit?

    user.admin? || user.owner?(test)
  end

  def index

    user.admin? || user.owner?(test)
  end




end