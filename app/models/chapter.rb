class Chapter < ApplicationRecord
  belongs_to :manga

  # Validations
  validates :title, presence: true
  validates :number, presence: true, numericality: { only_integer: true }, uniqueness: true


  def image_urls
    super || []
  end

  # Method to generate Cloudinary URLs for images
  def cloudinary_image_urls
    image_urls.map { |public_id| Cloudinary::Utils.cloudinary_url(public_id) }
  end
end
