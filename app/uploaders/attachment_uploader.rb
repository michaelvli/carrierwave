class AttachmentUploader < CarrierWave::Uploader::Base
#  storage :file # using :fog instead
  storage :fog
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
#    %w(pdf doc htm html docx)
    %w(jpg jpeg png gif)
  end
end