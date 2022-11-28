class Site < ApplicationRecord
  has_many :notes
  belongs_to :tour

  validates :name, :longitude, :latitude, presence: true
end
