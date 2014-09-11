# Be sure to restart your server when you modify this file.

# Configuation below is for use with carrierwave-aws gem
CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = 'barfly_carrierwave'
  config.aws_acl    = :public_read
  config.asset_host = 'https://s3.amazonaws.com/barfly_carrierwave' #  https://s3.amazonaws.com/barfly_carrierwave/uploads/resume/attachment/8/american_junkie.mp4
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

  config.aws_credentials = {
    access_key_id:     ENV["AWS_KEY_ID"], # For dev and test environments - look in config/application.yml
    secret_access_key: ENV["AWS_KEY_VALUE"], # For dev and test environments - look in config/application.yml
  }
end


# Configuation below is for use with Fog
#CarrierWave.configure do |config|
#  config.fog_credentials = {
#    :provider               => 'AWS',  # required
#    :aws_access_key_id      => 'AKIAIS62QDJNWXZTC6JA',  # required
#    :aws_secret_access_key  => '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',  # required
#    :region                 => 'us-east-1'  # optional, defaults to 'us-east-1'
#  }
#  config.fog_directory  = 'barfly_carrierwave'  # required
#  config.fog_public     = false  # optional, defaults to true
#  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
#end