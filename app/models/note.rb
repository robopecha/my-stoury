class Note < ApplicationRecord
  belongs_to :site
  has_rich_text :rich_content
  has_many_attached :photos

  validates :rich_content, presence: true
end
