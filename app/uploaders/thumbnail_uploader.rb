class ThumbnailUploader < CarrierWave::Uploader::Base


  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  version :thumbnail do
    process resize_to_fill: [50, 50]
  end

end
