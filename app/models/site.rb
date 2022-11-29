class Site < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :notes
  belongs_to :tour


  validates :name, :address, presence: true

end
