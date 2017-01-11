class Team < ActiveRecord::Base
  has_many :users
  has_many :team_games
  has_many :games, through: :team_games
  has_many :team_practices
  has_many :practices, through: :team_practices

  validates :name, presence: true

  scope :wins, -> { order(wins: :desc) }

	def users_attributes=(users_attributes)
    users_attributes.each do |i, user_attributes|
		    team_user = self.users.build(user_attributes)
        team_user.update(team_id: self.id)
		    self.users << team_user
    end
	end

  def players
    self.users.where(role: 0)
  end

  def coach_name
    self.users.detect { |user| user.coach? }.name
  end

  def self.top_five_teams
    wins.limit(5)
  end

end
