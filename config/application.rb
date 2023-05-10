require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module PuntosPoint
  class Application < Rails::Application
    config.time_zone = 'Buenos Aires'
    config.active_record.default_timezone = :local
    config.load_defaults 7.0
    config.api_only = true
    config.autoload_paths << Rails.root.join('lib')
    config.active_job.queue_adapter = :sidekiq
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
    config.cache_store = :mem_cache_store
  end
end
