require 'rails_helper'

RSpec.describe 'Interest', type: :request do
    context 'POST #create' do 
        it 'should create new rating' do 
            usuario = create(:user, id:1)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            musica = create(:song)
            visit songs_path
            click_on "Show"
            valor = 5
            fill_in "Value", with: valor
            click_on "Enviar"
            expect(page.current_path).to eq song_path(musica.id)
            expect(page).to have_content("Rating: #{valor}") 
        end
    end
    context 'PATCH #edit' do 
        it 'should edit existing rating' do 
            usuario = create(:user, id:1)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            musica = create(:song)
            visit songs_path
            click_on "Show"
            valor = 5
            fill_in "Value", with: valor
            click_on "Enviar"
            valor2 = 4
            fill_in "Value", with:valor2
            click_on "Enviar"
            expect(page.current_path).to eq song_path(musica.id)
            expect(page).to have_content("Rating: #{valor2}") 
        end
    end
end