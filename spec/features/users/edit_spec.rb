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

  it 'user changes email address' do
    visit edit_user_registration_path(user)
    fill_in 'Email', :with => 'newemail@example.com'
    fill_in 'Current password', :with => user.password
    click_button 'Update'
    txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  it "user cannot cannot edit another user's profile", :me do
    other = User.create(name: "Other User", email: 'otheremail@example.com', password: "otherpassword")
    visit edit_user_registration_path(other)
    expect(page).to have_content 'Edit User'
    expect(page).to have_field('Email', with: user.email)
  end

end
