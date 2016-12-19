require 'rails_helper'

RSpec.describe Practice, :type => :model do
  let(:practice) {
    Practice.create(
      :datetime => "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}"
    )
  }

  it "is valid with a datetime" do
    expect(practice).to be_valid
  end

end
