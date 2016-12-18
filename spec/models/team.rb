require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) {
    Team.create(
      :name => "Green Goblins"
    )
  }

  it "is valid with a name" do
    expect(team).to be_valid
  end

  it "has many players" do
    user = User.create(name: "Player 2", team_id: team.id)
    expect(team.user.count).to eq(1)
  end

  it "#name returns a string" do
    expect(@user.name).to be_a(String)
  end

end
