require 'rails_helper'

RSpec.describe 'Interest', type: :request do
    context 'GET #index' do 
        it 'should render interest index page' do 
            usuario = create(:user, id:1)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            visit index_path
            expect(page.current_path).to eq index_path
            expect(page).to have_content("My Interests") 
        end
    end
    context 'POST #create' do 
        it 'should create new interest and render My Interests page' do 
            usuario = create(:user, id:1)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            create(:song)
            visit songs_path
            click_on "Like"
            expect(page.current_path).to eq index_path
            expect(page).to have_content("My Interests") 
        end
    end
    context 'PATCH #edit' do 
        it 'should edit an existing interest and render My Interests page' do 
            usuario = create(:user, id:1)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            song = create(:song)
            visit songs_path
            click_on "Like"
            visit songs_path
            click_on "Dislike"
            expect(song.interests.first.opinion).to eq false
            expect(page.current_path).to eq index_path
            expect(page).to have_content("My Interests") 
        end
    end
end