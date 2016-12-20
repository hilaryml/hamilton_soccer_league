class TeamPractice < ActiveRecord::Base
  belongs_to :team
  belongs_to :practice
end
