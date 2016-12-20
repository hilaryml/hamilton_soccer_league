class Team < ActiveRecord::Base
  has_many :users

  def players
    self.users.where(role: 0)
  end

  def coach_name
    self.users.detect { |user| user.coach? }.name
  end
end
