class Team < ActiveRecord::Base
  has_many :users

  def players_names
    players = self.users.map { |user| user.player? }
    players.each { |player| player.name }
  end

  def coach_name
    self.users.detect { |user| user.coach? }.name
  end
end
