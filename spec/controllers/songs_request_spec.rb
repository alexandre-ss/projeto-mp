require 'rails_helper'

RSpec.describe 'Song', type: :request do
    context 'GET #index' do 
        it 'should render song index page' do 
            visit songs_path
            expect(page.current_path).to eq songs_path
            expect(page).to have_content("Songs") 
        end
    end
    context 'GET #show' do 
        it 'should render song page' do 
            create(:user, id:1)
            musica = create(:song)
            visit song_path(musica.id)
            expect(page.current_path).to eq song_path(musica.id)
        end
    end
    context 'POST #new' do 
        it 'should create new song and redirect to show song page' do 
            usuario = create(:user, id:1)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            visit new_song_path
            musica = build(:song)
            fill_in "Title", with: musica.title 
            fill_in "Artist", with: musica.artist 
            click_on "Enviar"
            expect(page.current_path).to eq song_path(Song.last.id)
            expect(page).to have_content("Song was successfully created.")
        end
        context 'PATCH #edit' do 
            it 'should edit song and redirect to show song page' do 
                usuario = create(:user, id:1)
                visit new_user_session_path
                fill_in "Email", with: usuario.email
                fill_in "Password", with: usuario.password
                click_on "Log in"
                musica = create(:song)
                visit edit_song_path(musica.id)
                fill_in "Title", with: "musicateste2"
                fill_in "Artist", with: "musicoteste2" 
                click_on "Enviar"
                expect(page).to have_content("Song was successfully updated.")
                expect(page.current_path).to eq song_path(musica.id)
            end
        end
        context 'DELETE #delete' do 
            it 'should create new song' do 
                usuario = create(:user, id:1)
                visit new_user_session_path
                fill_in "Email", with: usuario.email
                fill_in "Password", with: usuario.password
                click_on "Log in"
                musica = create(:song)
                visit songs_path
                click_on "Destroy"
                expect(page).to have_content("Song was successfully destroyed.")
                expect(page.current_path).to eq songs_path
            end
        end
    end
end