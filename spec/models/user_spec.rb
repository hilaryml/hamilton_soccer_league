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
      :team_id => team.id
    )
  }

  let(:game) {
    Game.create(
    datetime: "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
    location: "City Park"
    )
  }

  let(:practice) {
    Practice.create(
      :datetime => "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
      :location => "City Park"
    )
  }

  it "is valid with a team_id" do
    expect(user).to be_valid
  end

  it "belongs to one team" do
    expect(user.team).to eq(team)
  end

  it "has many game_users" do
    game_user = GameUser.create(user_id: user.id, game_id: game.id)
    expect(user.game_users.first).to eq(game_user)
  end

  it "has many games through game_players" do
    user.games << game
    expect(user.games.first).to eq(game)
  end

  it "has many practice users" do
    practice_user = PracticeUser.create(user_id: user.id, practice_id: practice.id)
    expect(user.practice_users.first).to eq(practice_user)
  end

  it "has many practices through practice users" do
    user.practices << practice
    expect(user.practices.first).to eq(practice)
  end

  it "#role is 'player' by default" do
    expect(user.role).to eq "player"
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
