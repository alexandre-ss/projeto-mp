class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :songs
  has_many :interests, dependent: :destroy
  has_many :ratings, dependent: :destroy

  def is_admin
    return self.role == "admin"
  end

end
