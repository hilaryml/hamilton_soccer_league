require 'rails_helper'

RSpec.describe User, :type => :feature do

  let(:user) {
    User.create(
    name: "New User",
    email: "useremail@email.com",
    password: "userpassword"
    )
  }

  before(:each) do
    visit root_path
    click_on "Sign in"
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on "Log in"
  end

  it 'user sees own profile' do
    visit user_path(user)
    expect(page).to have_content 'User'
    expect(page).to have_content user.email
  end

  it "user cannot see another user's profile" do
    other = User.create(name: "Other User", email: 'otheremail@example.com', password: "otherpassword")
    visit user_path(other)
    expect(page).to have_content 'Access denied.'
  end

end
