def sign_in_as user
  visit new_user_session_path
  sign_in_form_as user
end

def sign_in_form_as user
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end
