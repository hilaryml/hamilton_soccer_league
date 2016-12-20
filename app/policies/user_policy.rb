class UserPolicy < ApplicationPolicy

  def show?
    user.coach? || record == user
  end

  def create?
    record == user || user.coach?
  end

  def update?
    record == user || user.coach?
  end

  def destroy?
    record == user || user.coach?
  end
end
