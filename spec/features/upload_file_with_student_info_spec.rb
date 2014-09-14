require 'spec_helper'
require 'helpers/user_sessions_helper'

feature 'Upload File' do
  background do
    user = Fabricate(:user, email: 'joe@example.com', password: 'password')
    sign_in_as user
  end

  scenario 'successful upload' do
    click_link 'Add Students'
    attach_file('upload', 'spec/data/DRE Program Download for Upload(1)_test.csv')
    click_button 'Upload'
    Student.count.should == 5
  end

  scenario 'update pre-existing records' do
    click_link 'Add Students'
    attach_file('upload', 'spec/data/DRE Program Download for Upload(1)_test_dup.csv')
    click_button 'Upload'
    Student.count.should == 3
    mary = Student.find_by(psi: 35662)
    mary.mi.should == nil

    click_link 'Add Students'
    attach_file('upload', 'spec/data/DRE Program Download for Upload(1)_test.csv')
    click_button 'Upload'
    Student.count.should == 5
    mary = Student.find_by(psi: 35662)
    mary.mi.should == 'B'
  end
end
