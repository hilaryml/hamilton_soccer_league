class Team < ActiveRecord::Base
  has_many :users
  has_many :team_games
  has_many :games, through: :team_games
  has_many :team_practices
  has_many :practices, through: :team_practices

  validates :name, presence: true

  def coach_attributes=(coach)
		team_coach = User.find_or_create_by(email: coach.email)
		team_coach.update(coach)
		team_coach.update(role: 1)
		self.users << team_coach
	end

	def players_attributes=(players)
    players.each do |player, attributes|
		    team_player = User.find_or_create_by(email: player.email)
		    team_player.update(player)
		    self.users << team_player
    end
	end

  def players
    self.users.where(role: 0)
  end

  def coach_name
    self.users.detect { |user| user.coach? }.name
  end
end
