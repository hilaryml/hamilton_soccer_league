class TeamPolicy < ApplicationPolicy

  def show?
    user.coach? || record.users.include?(user)
  end

  def create?
    user.coach?
  end

  def update?
    user.coach? && record.users.include?(user)
  end

  def destroy?
    user.coach? && record.users.include?(user)
  end
end
