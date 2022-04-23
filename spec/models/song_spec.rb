require 'rails_helper'

RSpec.describe Song, type: :model do
  context 'check Song' do 
    it 'when the song is ok' do
      create(:user, id:1)
      musica = create(:song)
      expect(musica).to be_valid
    end
    it 'when the song has no title' do
      usuario = build(:user, id:1)
      musica = build(:song, title:nil)
      expect(musica).to be_invalid
    end
    it 'when the song has no artist' do
      usuario = build(:user, id:1)
      musica = build(:song, artist:nil)
      expect(musica).to be_invalid
    end
    it 'when the song has no poster/user' do
      musica = build(:song)
      expect(musica).to be_invalid
    end
  end
end