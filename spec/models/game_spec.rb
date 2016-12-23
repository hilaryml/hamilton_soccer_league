require 'rails_helper'

RSpec.describe Game, :type => :model do
  let(:game) {
    Game.create(
      :date => "#{Date.today}",
      :time => "#{Time.now}",
      :location => "City Park"
    )
  }

  it "is valid with a date, time and a location" do
    expect(game).to be_valid
  end

end
