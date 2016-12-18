require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:team) {
    Team.create(
      :name => "Green Goblins"
    )
  }

  let(:user) {
    User.create(
      :name => "Player 1",
      :email => "email@email.com",
      :password => "password",
    )
  }

  let(:game) {
    Game.create(
    datetime: today_plus_one.to_s,
    location: "City Park"
    )
  }

  let(:practice) {
    Practice.create(
      :datetime => today_plus_one.to_s,
      :location => "City Park",
    )
  }

  it "is valid with a team_id" do
    expect(user).to be_valid
  end

  it "belongs to one team" do
    expect(user.team).to eq(team)
  end

  it "has many game_players" do
    game_player = GamePlayer.create(user_id: user.id, game_id: game.id)
    expect(user.game_players.first).to eq(game_player)
  end

  it "has many games through game_players" do
    user.games << game
    expect(user.games.first).to eq(game)
  end

  it "has many practice_players" do
    practice_player = PracticePlayers.create(user_id: user.id, game_id: game.id)
    expect(user.practice_players.first).to eq(practice_player)
  end

  it "has many practices through practice_players" do
    user.practices << practice
    expect(user.practices.first).to eq(practice)
  end

  it "#role is 'user' by default" do
    expect(user.role).to eq "user"
  end

  it "#role can be set to :coach" do
    user.role = :coach
    expect(user.role).to eq "coach"
  end

  it "#email returns a string" do
    expect(user.email).to be_a(String)
  end

  it "#name returns a string" do
    expect(user.name).to be_a(String)
  end

end
