class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url(*_args)
    '/images/' + [version_name, 'default.png'].compact.join('_')
  end

  version :thumb do
    process resize_to_fit: [128, 128]
  end

  version :medium do
    process resize_to_fit: [360, 360]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
