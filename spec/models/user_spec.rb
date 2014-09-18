describe User do
  it { should validate_uniqueness_of :email }
end
