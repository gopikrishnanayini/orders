class AvatarUploader < CarrierWave::Uploader::Base

  def extension_white_list
    CARRIERWAVE_ALLOWED_EXTENSIONS
  end

  def content_type_whitelist
    CARRIERWAVE_ALLOWED_MIME_TYPES
  end

  # Available after carrierwave >= 1.0
  def size_range
    CARRIERWAVE_MAX_FILE_SIZE
  end

  # Choose what kind of storage to use for this uploader:

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
