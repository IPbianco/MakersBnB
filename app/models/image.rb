class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def filename(rental_class: Rental)
    "#{rental_class.count}.#{file.extension}"
  end
end

class Image
  include DataMapper::Resource

  property :id, Serial
  mount_uploader :file, ImageUploader
end
