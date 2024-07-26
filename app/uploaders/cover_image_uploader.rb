class CoverImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # Optional: You can add process or other configurations here
  process convert: 'png'

  # Use Cloudinary for storage
  storage :cloudinary
end
