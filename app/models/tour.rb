class Tour < ApplicationRecord
  has_many :sites
  belongs_to :user

  validates :name, presence: true
end
