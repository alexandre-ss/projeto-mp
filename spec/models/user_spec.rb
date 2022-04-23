require 'rails_helper'

RSpec.describe User, type: :model do
  context 'check User' do 
    it 'when the user is ok' do
      usuario = build(:user)
      expect(usuario).to be_valid
    end
    # it 'when the user has no name' do
    #     usuario = build(:user, name:nil)
    #     expect(usuario).to be_invalid
    # end
    it 'when the user has no email' do
        usuario = build(:user, email:nil)
        expect(usuario).to be_invalid
    end
    it 'when the user has no password' do
        usuario = build(:user, password:nil)
        expect(usuario).to be_invalid
    end
  end
end