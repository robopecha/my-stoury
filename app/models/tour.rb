class Tour < ApplicationRecord
  has_many :sites
  has_many :tour_users
  has_many :users, through: :tour_users
  has_one_attached :photo

  validates :name, presence: true
end
