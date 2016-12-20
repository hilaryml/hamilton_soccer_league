require 'rails_helper'

RSpec.describe TeamGame, :type => :model do
  let(:team_game) {
    TeamGame.create(
      :team_id => team.id,
      :game_id => game.id
    )
  }

  let(:team) {
    Team.create(
      :name => "Team 1"
    )
  }

  let(:game) {
    Game.create(
    datetime: "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
    location: "City Park"
    )
  }

  it "is valid with a team_id and a game_id" do
    expect(team_game).to be_valid
  end

  it "belongs to one game" do
    expect(team_game.game).to eq(game)
  end

  it "belongs to one team" do
    expect(team_game.team).to eq(team)
  end

end
