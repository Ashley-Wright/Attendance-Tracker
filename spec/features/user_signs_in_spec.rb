require 'spec_helper'

feature "User signs in" do
  scenario "successful sign in" do
    Fabricate(:user, email: "joe@example.com", password: "password")
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessful sign in" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "joe@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    expect(page).to have_content "Invalid email or password."
  end
end