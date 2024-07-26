class Manga < ApplicationRecord
  belongs_to :user

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

  private

  def cover_image_present?
    cover_image.present?
  end
end
