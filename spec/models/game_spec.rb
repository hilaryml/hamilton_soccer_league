require 'rails_helper'

RSpec.describe Game, :type => :model do
  let(:game) {
    Game.create(
      :datetime => today_plus_one.to_s
    )
  }

  it "is valid with a datetime" do
    expect(game).to be_valid
  end

end
