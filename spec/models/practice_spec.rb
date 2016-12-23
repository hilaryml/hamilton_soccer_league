require 'rails_helper'

RSpec.describe Practice, :type => :model do
  let(:practice) {
    Practice.create(
    :date => "#{Date.today}",
    :time => "#{Time.now}",
    :location => "City Park"
    )
  }

  it "is valid with a datetime" do
    expect(practice).to be_valid
  end

end
