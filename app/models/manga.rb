class Manga < ApplicationRecord
  belongs_to :user
  has_many :chapters, dependent: :destroy
  has_many :ratings
  has_many :comments
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  

  # Validations
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :published_date, presence: true
  validates :user_id, presence: true
  validates :cover_image, presence: true, if: :cover_image_present?

  # Method to set Cloudinary URL
  def cover_image_url
    Cloudinary::Utils.cloudinary_url(cover_image)
  end

  def self.search(query)
    where("LOWER(title) LIKE ? OR LOWER(author) LIKE ? OR LOWER(description) LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  end

  private

  def cover_image_present?
    cover_image.present?
  end
end
