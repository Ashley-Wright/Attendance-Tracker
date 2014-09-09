require 'spec_helper'
require 'helpers/user_sessions_helper'

feature 'Upload File' do
  scenario 'successful upload' do
    user = Fabricate(:user, email: 'joe@example.com', password: 'password')
    sign_in_as user
    click_link 'Add Students'
    attach_file('upload', 'spec/data/DRE Program Download for Upload(1)_test.xls')
    click_button 'Upload'
    pending 'need to implement Student model'
    expect(Student.count) == 5
  end
end
