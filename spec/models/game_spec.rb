require 'rails_helper'

RSpec.describe Game, :type => :model do
  let(:game) {
    Game.create(
      :datetime => "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}"
    )
  }

  it "is valid with a datetime" do
    expect(game).to be_valid
  end

end
