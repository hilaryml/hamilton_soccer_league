require 'rails_helper'

RSpec.describe Game, :type => :model do
  let(:game) {
    Game.create(
      :datetime => "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}",
      :location => "City Park"
    )
  }

  it "is valid with a datetime and a location" do
    expect(game).to be_valid
  end

end
