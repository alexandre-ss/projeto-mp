require 'rails_helper'

RSpec.describe Rating, type: :model do
  context 'check Rating' do 
    it 'when the rating is ok' do
        create(:user, id:1)
        create(:song, id:1)
        rating = build(:rating)
        expect(rating).to be_valid
    end
    it 'when the rating has no value' do
        create(:user, id:1)
        create(:song, id:1)
        rating = build(:rating, value:nil)
        expect(rating).to be_invalid
    end
    it 'when the ratings value is greater than 5' do
        create(:user, id:1)
        create(:song, id:1)
        rating = build(:rating, value:6)
        expect(rating).to be_invalid
    end
    it 'when the ratings value is less than 1' do
        create(:user, id:1)
        create(:song, id:1)
        rating = build(:rating, value:0)
        expect(rating).to be_invalid
    end
    it 'when the ratings value is float' do
        create(:user, id:1)
        create(:song, id:1)
        rating = build(:rating, value:5.5)
        expect(rating).to be_invalid
    end
    it 'when the rating has no user' do
        create(:user, id:1)
        create(:song, id:1)
        rating = build(:rating, user_id:nil)
        expect(rating).to be_invalid
    end
    it 'when the rating has no song' do
        create(:user, id:1)
        rating = build(:rating, song_id:nil)
        expect(rating).to be_invalid
    end
    it 'when the ratings song does not exist' do
        create(:user, id:1)
        rating = build(:rating)
        expect(rating).to be_invalid
    end
  end
end

