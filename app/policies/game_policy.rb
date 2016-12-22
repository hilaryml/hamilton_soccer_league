class GamePolicy < ApplicationPolicy

  def create?
    user.coach?
  end

  def update?
    user.coach?
  end

  def destroy
    user.coach?
  end

end
