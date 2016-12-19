require 'rails_helper'

RSpec.describe User, :type => :feature do

  it 'user sees own email address' do
    user = User.create(name: "New User", email: "useremail@email.com", password: "userpassword")
    visit root_path
    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on "Log In"
    visit users_path
    expect(page).to have_content user.email
  end

end
