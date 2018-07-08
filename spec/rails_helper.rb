# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require 'support/factory_bot'
require 'support/auth_helpers'
require 'simplecov'
if ENV['CIRCLE_ARTIFACTS']
  dir = File.join(ENV['CIRCLE_ARTIFACTS'], 'coverage')
  SimpleCov.coverage_dir(dir)
end
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
REQUEST_HEADERS = {
  'Accept' => 'application/json',
  'Content-Type' => 'application/json'
}.freeze
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include AuthHelpers
end
