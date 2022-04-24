class Interest < ApplicationRecord
  validates_inclusion_of :opinion, :in => [true, false]

  belongs_to :user
  belongs_to :song
end
