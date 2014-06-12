require 'spec_helper'
require 'helpers/user_sessions_helper'

feature "User signs in" do
  scenario "successful sign in" do
    user = Fabricate(:user, email: "joe@example.com", password: "password")
    visit root_path
    click_link "Sign In"
    sign_in_form_as user
    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessful sign in" do
    user = Fabricate.build(:user, email: "joe@example.com", password: "password")
    visit root_path
    click_link "Sign In"
    sign_in_form_as user
    expect(page).to have_content "Invalid email or password."
  end
end
