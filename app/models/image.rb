class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def filename
    "#{Rental.count}.#{file.extension}"
  end
end

class Image
  include DataMapper::Resource

  property :id, Serial
  mount_uploader :file, ImageUploader
end
