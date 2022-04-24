class Song < ApplicationRecord
    validates :title, :artist, presence: true

    belongs_to :user
    has_many :interests, dependent: :destroy
    has_many :ratings, dependent: :destroy
    has_one_attached :image
end
