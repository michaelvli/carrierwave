class VideoUploader < CarrierWave::Uploader::Base
  # for more info on CarrierWave callbacks (i.e. store), see https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-use-callbacks
  after :store, :zencode # tells Carrierwave to call method zencode after the video file has finished uploading
  
  # include modules that are necessary to use zencoder_url url helper in the uploader code
  include Rails.application.routes.url_helpers # providers access to urls generated by resources in config/routes.rb
  Rails.application.routes.default_url_options = ActionMailer::Base.default_url_options
  
  	# store_dir() method - tells which directory to upload the file on our storage provider.
	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

	# Lists file extension that should be allowed to be stored.
	def extension_white_list
		%w(mp4 mov)
	end
  
#	def thumbnail_url
#		@thubnail_url ||= url_for_format('thumbnail', 'png')
#	end

#	def mp4_url
#		@mp4_url ||= url_for_format('mp4')
#	end

#	def webm_url
#		@webm_url ||= url_for_format('webm')
#	end

#	def ogv_url
#		@ogv_url ||= url_for_format('ogv')
#	end

	
  private
  
  def zencode(*args)
    params = {
      :input         => @model.attachment.url,
      :test          => true, # https://app.zencoder.com/docs/guides/getting-started/test-jobs-and-integration-mode
	  :notifications => [zencoder_url], # tells Zencoder where to send a POST request once the encoding job is completed
	  :pass_through  => @model.id, # passes back the id of the completed video that is being encoded
      :outputs => [
        { # MP4 
          :public      => true,
          :base_url    => base_url,
          :filename    => 'mp4_' + filename_without_ext + '.mp4',
          :label       => 'webmp4',
          :format      => 'mp4',
          :audio_codec => 'aac',
          :video_codec => 'h264'
        },
        { # WebM 
          :public      => true,
          :base_url    => base_url,
          :filename    => 'webm_' + filename_without_ext + '.webm',
          :label       => 'webwebm',
          :format      => 'webm',
          :audio_codec => 'vorbis',
          :video_codec => 'vp8'
        },
        { # OGV
          :public      => true,
          :base_url    => base_url,
          :filename    => 'ogv_' + filename_without_ext + '.ogv',
          :label       => 'webogv',
          :format      => 'ogv',
          :audio_codec => 'vorbis',
          :video_codec => 'theora'
        },
        {
         :thumbnails => {
           :public      => true,
           :base_url    => base_url,
           :filename    => filename_without_ext,
           :times       => [4],
           :aspect_mode => 'preserve',
           :width       => '100',
           :height      => '100'
         }
       }
     ]
    }
	
    z_response = Zencoder::Job.create(params) # makes a request to the Zencoder API and returns a JSON response - https://app.zencoder.com/docs/api/jobs/create	
# DEBUG: Rails.logger.debug("params: #{params.inspect}")
# DEBUG: Rails.logger.debug("z_response: #{z_response.body}")
# DEBUG: Rails.logger.debug("model.meta_info: #{@model.meta_info.inspect}")	
    @model.meta_info[:request] = z_response.body # meta_info attribute is created by the store method - see models/video.rb
    @model.save(:validate => false)
  end
  
  def filename_without_ext
    @filename_without_ext ||= File.basename(@model.attachment.url, File.extname(@model.attachment.url))
  end
  
  def base_url
    @base_url ||= File.dirname(@model.attachment.url)
  end
  
#  def url_for_format(prefix, extension = nil)
#    extension ||= prefix 
#    base_url + '/' + prefix + '_' + filename_without_ext + '.' + extension
#  end
  
end