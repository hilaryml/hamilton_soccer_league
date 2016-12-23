class Practice < ActiveRecord::Base
  
  has_many :team_practices
  has_many :teams, through: :team_practices

  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true

end
