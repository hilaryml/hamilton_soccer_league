class Game < ActiveRecord::Base

  has_many :team_games
  has_many :teams, through: :team_games
  has_many :comments
  has_many :users, through: :comments

  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true

  def format_date
    self.date.strftime("%B %-d")
  end

  def format_time
    self.time.strftime("%I:%M %P")
  end

  def versus
    "#{self.teams[0].name} vs. #{self.teams[1].name}"
  end

end
