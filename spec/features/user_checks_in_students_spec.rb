feature 'check in student' do
  scenario 'successful check in, by name' do
    Fabricate(:student, name: 'Doe, Jane', psi: '22548', first: 'Jane', last: 'Doe', dob: Date.new(1996,3,19))
    user = Fabricate(:user, email: 'joe@example.com', password: 'password')
    sign_in_as user

    pending 'needs Attendance model'
    select('Doe, Jane', :from => 'student')
    click_button 'Check In'

    Attendance.count.should == 1
    Attendance.last.student.name.should == 'Doe, Jane'
  end
end
