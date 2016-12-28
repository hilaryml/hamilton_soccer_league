class TeamPolicy < ApplicationPolicy

  def show?
    user.try(:coach) || record.users.include?(user)
  end

  def create?
    user.try(:coach)
  end

  def update?
    user.try(:coach)
  end

  def destroy?
    user.try(:coach)
  end
end
