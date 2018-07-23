require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Fine
  class Application < Rails::Application
    config.load_defaults 5.2

    config.eager_load_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('app/services')

    config.api_only = true
  end
end
