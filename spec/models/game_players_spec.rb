require 'rails_helper'

RSpec.describe GamePlayers, :type => :model do
  let(:game_players) {
    GamePlayer.create(
      :user_id => user.id
      :game_id => game.id
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

  it "is valid with a player_id and a game_id" do
    expect(game_players).to be_valid
  end

  it "belongs to one game" do
    expect(game_players.game).to eq(game)
  end

  it "belongs to one player" do
    expect(game_players.player).to eq(player)
  end

end
