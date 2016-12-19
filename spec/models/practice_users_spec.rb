require 'rails_helper'

RSpec.describe PracticeUser, :type => :model do
  let(:practice_user) {
    PracticeUser.create(
      :user_id => user.id,
      :practice_id => practice.id
    )
  }

  let(:user) {
    User.create(
      :name => "Player 1",
      :email => "email@email.com",
      :password => "password"
    )
  }

  let(:practice) {
    Practice.create(
    datetime: "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
    location: "City Park"
    )
  }

  it "is valid with a user_id and a game_id" do
    expect(practice_user).to be_valid
  end

  it "belongs to one practice" do
    expect(practice_user.practice).to eq(practice)
  end

  it "belongs to one user" do
    expect(practice_user.user).to eq(user)
  end

end
