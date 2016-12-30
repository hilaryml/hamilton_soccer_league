require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:user) {
    User.create(
      :name => "Player 1",
      :email => "email@email.com",
      :password => "password"
    )
  }

  let(:game) {
    Game.create(
      :date => "#{Date.today}",
      :time => "#{Time.now}",
      :location => "City Park"
    )
  }

  let(:comment) {
    Comment.create(
      :user_id => "#{user.id}",
      :game_id => "#{game.id}",
      :content => "I am a new comment!"
    )
  }

  it "is valid with content" do
    expect(comment).to be_valid
  end

  it "belongs to one user" do
    expect(comment.user).to eq(user)
  end

  it "belongs to one game" do
    expect(comment.game).to eq(game)
  end

end
