FactoryBot.define do 
    factory :user do 
        name { 'user' }
        email { ' testuser@mail.com' }
        password { 123456 }
    end
end