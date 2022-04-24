require 'rails_helper'
RSpec.describe Interest, type: :model do
  context 'check Interest' do 
    it 'when the interest has opinion = true' do
      create(:user, id:1)
      create(:song, id:1)
      interesse = build(:interest)
      expect(interesse).to be_valid
    end
    it 'when the interest has opinion = false' do
        create(:user, id:1)
        create(:song, id:1)
        interesse = build(:interest, opinion:false)
        expect(interesse).to be_valid
    end
    it 'when the interest has no opinion' do
        create(:user, id:1)
        create(:song, id:1)
        interesse = build(:interest, opinion:nil)
        expect(interesse).to be_invalid
    end
    it 'when the interest has no user' do
        create(:user, id:1)   ## O user deve ser criado, pois :song também requer que exista um usuário com id = 1
        create(:song, id:1)
        interesse = build(:interest, user_id:nil)
        expect(interesse).to be_invalid
    end
    it 'when the interest has no song' do
        create(:user, id:1)  
        interesse = build(:interest, song_id:nil)
        expect(interesse).to be_invalid
    end
    it 'when the interests song does not exist' do
        create(:user, id:1)  
        interesse = build(:interest)
        expect(interesse).to be_invalid
    end
  end
end