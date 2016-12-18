require 'rails_helper'

RSpec.describe PracticePlayers, :type => :model do
  let(:practice_players) {
    PracticePlayers.create(
      :user_id => user.id
      :practice_id => game.id
    )
  }

  let(:user) {
    User.create(
      :name => "Player 1",
      :email => "email@email.com",
      :password => "password",
    )
  }

  let(:practice) {
    Practice.create(
    datetime: today_plus_one.to_s,
    location: "City Park"
    )
  }

  it "is valid with a player_id and a game_id" do
    expect(game_player).to be_valid
  end

  it "belongs to one practice" do
    expect(game_player.game).to eq(game)
  end

  it "belongs to one player" do
    expect(game_player.player).to eq(player)
  end

end
