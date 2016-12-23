require 'rails_helper'

RSpec.describe TeamPractice, :type => :model do
  let(:team_practice) {
    TeamPractice.create(
      :team_id => team.id,
      :practice_id => practice.id
    )
  }

  let(:team) {
    Team.create(
      :name => "Team 1"
    )
  }

  let(:practice) {
    Practice.create(
    :date => "#{Date.today}",
    :time => "#{Time.now}",
    :location => "City Park"
    )
  }

  it "is valid with a team_id and a game_id" do
    expect(team_practice).to be_valid
  end

  it "belongs to one practice" do
    expect(team_practice.practice).to eq(practice)
  end

  it "belongs to one team" do
    expect(team_practice.team).to eq(team)
  end

end
