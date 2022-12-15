require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    user = User.create!(email: 'Testing@user.com', password: 'test123')
  end

  before { subject.save }

  it 'email should exist' do
    subject.email = nil
    expect(subject).to_not be_valid
  end



end
