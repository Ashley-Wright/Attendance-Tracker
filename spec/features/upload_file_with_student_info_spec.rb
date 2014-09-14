require 'spec_helper'
require 'helpers/user_sessions_helper'

feature 'Upload File' do
  scenario 'successful upload' do
    user = Fabricate(:user, email: 'joe@example.com', password: 'password')
    sign_in_as user
    click_link 'Add Students'
    attach_file('upload', 'spec/data/DRE Program Download for Upload(1)_test.csv')
    click_button 'Upload'
    Student.count.should == 5
  end
end
