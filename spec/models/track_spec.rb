require 'rails_helper'

RSpec.describe Track, type: :model do
  subject do
    user = User.create!(email: 'Testing@user.com', password: 'test123')
    album = user.albums.create!(name: 'Test Album', artist: 'Test Artist', genre: 'Test Genre', style: 'Test Style', format: 'Test Format', release_date: '2020-01-01', description: 'Test Description', image_data: ActiveSupport::JSON.encode({"id":"f54ffc627787659bf4b6c2889961e3ad.jpg","storage":"store","metadata":{"filename":"R-17179330-1612022526-4348.jpg","size":147887,"mime_type":"image/jpeg"}})  ) 
    album.tracks.create!(name: 'Test Track', time: 100, album_id: album.id) 
  end

  before { subject.save }
   
  it 'name should exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'time should exist' do
    subject.time = nil
    expect(subject).to_not be_valid
  end

  it 'album_id should exist' do
    subject.album_id = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be too long' do
    subject.name = 'a' * 51
    expect(subject).to_not be_valid
  end





end
