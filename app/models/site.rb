class Site < ApplicationRecord
  has_many :notes
  belongs_to :tour

  validates :name, presence: true
end
