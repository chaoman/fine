source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails', '~> 5.2.0'
gem 'pg'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jwt'
gem 'bcrypt'
gem 'fast_jsonapi'
gem 'decent_exposure'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

group :test do
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'rspec-rails', '~> 3.7.2'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'json_spec'
  gem 'rspec_api_documentation'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
