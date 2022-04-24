FactoryBot.define do 
    factory :rating do 
        value { 5 }
        user_id { 1 }
        song_id { 1 }
    end
end