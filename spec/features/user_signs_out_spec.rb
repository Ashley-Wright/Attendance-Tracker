require 'spec_helper'

feature "User signs out" do
  scenario "successful sign out" do
    Fabricate(:user, email: "joe@example.com", password: "password")
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    expect(page).to have_content "Signed in successfully."
    click_link "Sign Out"
    expect(page).to have_content "Signed out successfully."
  end
end
