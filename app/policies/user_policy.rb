class UserPolicy < ApplicationPolicy

  def show?
    user.coach? || record == user
  end

  def create?
    user.coach?
  end

  def update?
    user.coach?
  end

  def destroy?
    user.coach?
  end
end
