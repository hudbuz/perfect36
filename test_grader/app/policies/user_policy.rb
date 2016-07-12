class UserPolicy < ApplicationPolicy

  def index?

    user.admin?
  end

  def show?
    binding.pry
    user.admin? || record == user
  end

  def update?

    user.admin?

  end

  




end