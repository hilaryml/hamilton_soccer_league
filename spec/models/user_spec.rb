require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  it "belongs to a team" do
    @user.team.create
    expect(@user.team.count).to eq(1)
  end

  it "has many games" do
    @user.game.create
    expect(@user.game.count).to eq(1)
  end

  it "#role is 'user' by default" do
    expect(@user.role).to eq "user"
  end

  it "#role can be set to :coach" do
    @user.role = :coach
    expect(@user.role).to eq "coach"
  end

  it "#email returns a string" do
    expect(@user.email).to be_a(String)
  end

  it "#name returns a string" do
    expect(@user.name).to be_a(String)
  end

end
