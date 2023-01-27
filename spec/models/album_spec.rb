require 'rails_helper'

RSpec.describe Album, type: :model do
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

  it 'name should exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'artist should exist' do
    subject.artist = nil
    expect(subject).to_not be_valid
  end

  it 'genre should exist' do
    subject.genre = nil
    expect(subject).to_not be_valid
  end

  it 'style should exist' do
    subject.style = nil
    expect(subject).to_not be_valid
  end

  it 'format should exist' do
    subject.format = nil
    expect(subject).to_not be_valid
  end

  it 'release_date should exist' do
    subject.release_date = nil
    expect(subject).to_not be_valid
  end

  it 'description should exist' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'image_data should exist' do
    subject.image_data = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'artist should not be too long' do
    subject.artist = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'genre should not be too long' do
    subject.genre = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'style should not be too long' do
    subject.style = 'a' * 51
    expect(subject).to_not be_valid
  end

  it 'format should not be too long' do
    subject.format = 'a' * 51
    expect(subject).to_not be_valid
  end
end
