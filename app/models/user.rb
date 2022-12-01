class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tour_users
  has_many :tours, dependent: :destroy
  has_many :added_tours, through: :tour_users, source: :tour

  validates :username, presence: true

  def all_tours
    tours + added_tours
  end
end
