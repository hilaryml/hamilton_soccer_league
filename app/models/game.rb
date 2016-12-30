class Game < ActiveRecord::Base

  has_many :team_games
  has_many :teams, through: :team_games
  has_many :comments
  has_many :users, through: :comments

  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true

end
