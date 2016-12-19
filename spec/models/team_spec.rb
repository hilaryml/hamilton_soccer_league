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

  it "has many users" do
    user = User.create(name: "Player 1", team_id: team.id, email: "email@email.com", password: "password")
    expect(team.users.count).to eq(1)
  end

  it "#name returns a string" do
    expect(team.name).to be_a(String)
  end

end
