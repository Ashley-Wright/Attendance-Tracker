require 'spec_helper'

feature "User signs up" do
  scenario "successful sign up" do
    visit root_path
    click_link "Sign Up"
    fill_in "Email", with: "joe@example.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end