class Image < ApplicationRecord
  belongs_to :chapter

  validates :image_url, presence: true
  validates :order, presence: true, numericality: { only_integer: true }

  scope :ordered, -> { order(:order) }
end
