class AddressUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  include CarrierWaveDirect::Uploader
  storage :fog
  process :save_video_duration
#  process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]


version :thumb do
    process thumbnail: [{format: 'png', quality: 10,seek: '50%' ,square: true, size: 192, strip: false, logger: Rails.logger}]
    def full_filename for_file
      png_name for_file, version_name
    end
    process :fix_content_type
end


  def fix_content_type
      file.content_type = 'image/png' if file
  end

  def save_video_duration
      video = FFMPEG::Movie.new(file.file)
      model.send(:set_success2,video.duration)
  end

  def content_type_blacklist
      ['application/text']
  end

  def filename
      "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def png_name for_file, version_name
      %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
  end

  def extension_white_list
      %w( mp4 jpg jpeg gif png )
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
