class Rating < ApplicationRecord
  validates :value, presence: true
  validates :value, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  belongs_to :user
  belongs_to :song

  def self.rating_average 
    sum = 0
    self.all.each{|r| sum += r.value}
    (sum.to_f/self.all.count).round(2)
  end

end
