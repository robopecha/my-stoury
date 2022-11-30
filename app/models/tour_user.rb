class TourUser < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :user, uniqueness: { scope: :tour }
end
