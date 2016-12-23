class Team < ActiveRecord::Base
  has_many :users
  has_many :team_games
  has_many :games, through: :team_games
  has_many :team_practices
  has_many :practices, through: :team_practices

  validates :name, presence: true

  def players
    self.users.where(role: 0)
  end

  def coach_name
    self.users.detect { |user| user.coach? }.name
  end
end
