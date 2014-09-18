describe Student do
  it { should have_many :attendances }

  it { should validate_presence_of :name }
  it { should validate_presence_of :psi }
  it { should validate_presence_of :first }
  it { should validate_presence_of :last }
  it { should validate_presence_of :dob }

  it { should validate_uniqueness_of :psi }
end
