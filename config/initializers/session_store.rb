# Be sure to restart your server when you modify this file.

CarrierWave::Application.config.session_store :cookie_store, key: '_CarrierWave_session'

# Only needed for Uploadify (doesn't work on iPhone) 
#Rails.application.config.middleware.insert_before(
#  ActionDispatch::Session::CookieStore,
#  FlashSessionCookieMiddleware,
#  Rails.application.config.session_options[:key]
#)