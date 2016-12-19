require 'rails_helper'

RSpec.describe User, :type => :feature do

   it "user can delete own account" do
     user = User.create(name: "New User", email: "useremail@email.com", password: "userpassword")
     visit root_path
     click_on "Sign in"
     fill_in 'Email', with: user.email
     fill_in 'Password', with: user.password
     click_on "Log in"
     visit edit_user_registration_path(user)
     click_button 'Cancel my account'
     expect(page).to have_content I18n.t 'devise.registrations.destroyed'
   end
end
