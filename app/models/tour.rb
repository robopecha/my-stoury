class Tour < ApplicationRecord
  has_many :sites, dependent: :destroy
  has_many :tour_users, dependent: :destroy
  has_many :users, through: :tour_users
  has_one :chatroom, dependent: :destroy

  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
end
