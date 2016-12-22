class Practice < ActiveRecord::Base
  has_many :team_practices
  has_many :teams, through: :team_practices
end
