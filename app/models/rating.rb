class Rating < ApplicationRecord
  validates :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }


  belongs_to :user
  belongs_to :song
end
