require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject do
    user = User.create!(email: 'Testing@user.com', password: 'test123')
    user.albums.create!(name: 'Test Album', artist: 'Test Artist', genre: 'Test Genre', style: 'Test Style',
                        format: 'Test Format', release_date: '2020-01-01',
                        description: 'Test Description',
                        image_data: ActiveSupport::JSON.encode({ id: 'f54ffc627787659bf4b6c2889961e3ad.jpg',
                                                                 storage: 'store', metadata:
    { filename: 'R-17179330-1612022526-4348.jpg',
      size: 147_887, mime_type: 'image/jpeg' } }))
  end

  before { subject.save }

  it 'user_id should exist' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
