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

  it "is valid with a team_id" do
    expect(user).to be_valid
  end

  it "belongs to one team" do
    expect(user.team).to eq(team)
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
