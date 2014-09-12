require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module CarrierWave
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
	
	# Only needed for Uploadify (doesn't work on iPhone)
	# config.autoload_paths += %W(#{config.root}/app/middleware/**/*) 

	
	# In order to receive the callback, Zencoder must be able to connect to your server, 
	# so it needs to be on the open internet
	# http://www.nickdesteffen.com/blog/video-encoding-with-uploadify-carrierwave-and-zencoder
	 config.action_mailer.default_url_options = 'bench.herokuapp.com'
	
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
	
	# Setting up environment variables (in config/application.yml)
	if File.exists?(File.expand_path('../application.yml', __FILE__))
		config = YAML.load(File.read(File.expand_path('../application.yml', __FILE__)))
		config.merge! config.fetch(Rails.env, {})
		config.each do |key, value|
			ENV[key] ||= value.to_s unless value.kind_of? Hash
		end
	end

  end
end
