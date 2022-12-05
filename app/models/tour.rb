class Tour < ApplicationRecord
  has_many :sites, dependent: :destroy
  has_many :tour_users, dependent: :destroy
  has_many :users, through: :tour_users
  has_one :chatroom, dependent: :destroy

  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
