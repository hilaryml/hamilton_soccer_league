require 'rails_helper'

RSpec.describe GameUser, :type => :model do
  let(:game_users) {
    GameUser.create(
      :user_id => user.id,
      :game_id => game.id
    )
  }

  let(:user) {
    User.create(
      :name => "Player 1",
      :email => "email@email.com",
      :password => "password"
    )
  }

  let(:game) {
    Game.create(
    datetime: "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
    location: "City Park"
    )
  }

  it "is valid with a user_id and a game_id" do
    expect(game_users).to be_valid
  end

  it "belongs to one game" do
    expect(game_users.game).to eq(game)
  end

  it "belongs to one user" do
    expect(game_users.user).to eq(user)
  end

end
