class Team < ActiveRecord::Base
  has_many :users
  has_many :team_games
  has_many :games, through: :team_games
  has_many :team_practices
  has_many :practices, through: :team_practices

  validates :name, presence: true

	def users_attributes=(users_attributes)
    users_attributes.each do |user, attributes|
		    team_user = User.find_or_create_by(email: user.email)
		    team_user.update(user)
		    self.users << team_user
    end
	end

  def players
    self.users.where(role: 0)
  end

  def coach_name
    self.users.detect { |user| user.coach? }.name
  end
end
