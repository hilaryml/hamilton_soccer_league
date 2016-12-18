require 'rails_helper'

RSpec.describe Practice, :type => :model do
  let(:practice) {
    Practice.create(
      :datetime => today_plus_one.to_s
    )
  }

  it "is valid with a datetime" do
    expect(practice).to be_valid
  end

end
