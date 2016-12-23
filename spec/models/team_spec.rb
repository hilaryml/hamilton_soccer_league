require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) {
    Team.create(
      :name => "Green Goblins"
    )
  }

  let(:game) {
    Game.create(
    :date => "#{Date.today}",
    :time => "#{Time.now}",
    :location => "City Park"
    )
  }

  let(:practice) {
    Practice.create(
    :date => "#{Date.today}",
    :time => "#{Time.now}",
    :location => "City Park"
    )
  }

  it "is valid with a name" do
    expect(team).to be_valid
  end

  it "has many users" do
    user = User.create(name: "Player 1", team_id: team.id, email: "email@email.com", password: "password")
    expect(team.users.count).to eq(1)
  end

  it "has many team_games" do
    team_game = TeamGame.create(team_id: team.id, game_id: game.id)
    expect(team.team_games.first).to eq(team_game)
  end

  it "has many games through team_games" do
    team.games << game
    expect(team.games.first).to eq(game)
  end

  it "has many team practices" do
    team_practice = TeamPractice.create(team_id: team.id, practice_id: practice.id)
    expect(team.team_practices.first).to eq(team_practice)
  end

  it "has many practices through team practices" do
    team.practices << practice
    expect(team.practices.first).to eq(practice)
  end

  it "#name returns a string" do
    expect(team.name).to be_a(String)
  end

end
