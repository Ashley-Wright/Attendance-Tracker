require 'spec_helper'
require 'helpers/user_sessions_helper'

feature "User signs out" do
  scenario "successful sign out" do
    user = Fabricate(:user, email: "joe@example.com", password: "password")
    sign_in_as user
    click_link "Sign Out"
    expect(page).to have_content "Signed out successfully."
  end
end
