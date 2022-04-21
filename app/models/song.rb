class Song < ApplicationRecord
    belongs_to :user
    has_many :interests
    has_many :ratings
end
