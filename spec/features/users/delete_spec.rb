require 'rails_helper'

RSpec.describe User, :type => :feature do

     it "user can delete own account" do
       user = User.create(name: "New User", email: "useremail@email.com", password: "userpassword")
       visit root_path
       fill_in 'Name', with: user.name
       fill_in 'Email', with: user.email
       fill_in 'Password', with: user.password
       click_on "Log In"
       visit edit_user_registration_path(user)
       click_button 'Cancel my account'
       page.driver.browser.switch_to.alert.accept
       expect(page).to have_content I18n.t 'devise.registrations.destroyed'
     end
end
