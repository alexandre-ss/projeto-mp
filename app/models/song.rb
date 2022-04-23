class Song < ApplicationRecord
    belongs_to :user
    has_many :interests, dependent: :destroy
    has_many :ratings, dependent: :destroy
end
