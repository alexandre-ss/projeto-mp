FactoryBot.define do 
    factory :song do 
        title { 'test song' }
        artist { 'sound guy' }
        user_id { 1 }
    end
end