# Be sure to restart your server when you modify this file.

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJE7N7QMKT4NW5NTA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-east-1'                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'barfly_carrierwave'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end