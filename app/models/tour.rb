class Tour < ApplicationRecord
  has_many :sites, dependent: :destroy
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
end
