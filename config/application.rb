require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Onebitfood
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'America/Sao_Paulo'
    config.i18n.default_locale = 'pt-BR'
    #config.autoload_paths += %W(#{config.root}/lib)
    config.exceptions_app = self.routes
    #config.active_job.queue_adapter = :sidekiq
    #config.action_mailer.deliver_later_queue_name = 'mailers'
    config.active_record.belongs_to_required_by_default = false

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
