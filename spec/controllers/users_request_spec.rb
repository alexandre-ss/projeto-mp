require 'rails_helper'

RSpec.describe 'User', type: :request do
    context 'GET #sign_in' do 
        it 'should show success status and render homepage' do 
            usuario = create(:user)
            visit new_user_session_path
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            click_on "Log in"
            expect(page.current_path).to eq root_path
        end
    end
    context 'POST #sign_up' do 
        it 'should show success status and render homepage' do 
            visit new_user_registration_path
            usuario = create(:user)
            fill_in "Name", with: usuario.name
            fill_in "Email", with: usuario.email
            fill_in "Password", with: usuario.password
            fill_in "Password confirmation", with: usuario.password
            click_on "Sign up"
            expect(page.current_path).to eq user_registration_path
        end
        context 'DELETE #sign_out' do 
            it 'should show success status and render homepage' do 
                usuario = create(:user)
                visit new_user_session_path
                fill_in "Email", with: usuario.email
                fill_in "Password", with: usuario.password
                click_on "Log in"
                click_on "Sair"
                expect(page).not_to have_content("Sair")
                expect(page.current_path).to eq root_path
            end
        end
    end
end