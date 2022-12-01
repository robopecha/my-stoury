class Tour < ApplicationRecord
  has_many :sites, dependent: :destroy
  has_many :tour_users
  has_many :users, through: :tour_users

  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
end
