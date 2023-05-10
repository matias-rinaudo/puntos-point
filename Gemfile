source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'bcrypt', '~> 3.1', '>= 3.1.18'
gem 'jwt', '~> 2.7'
gem 'simple_command', '~> 1.0', '>= 1.0.1'
gem 'cancancan', '~> 3.5'
gem 'sidekiq', '~> 6.0'
gem 'sidekiq-cron', '~> 1.10'
gem 'active_model_serializers', '~> 0.10.13'
gem 'connection_pool', '~> 2.4'

group :development, :test do
  gem 'rails-erd', '~> 1.7', '>= 1.7.2'
  gem "byebug"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0', '>= 6.0.2'
end

group :test do
  gem 'database_cleaner', '~> 2.0', '>= 2.0.2'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.2'
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0', require: false
  gem 'webmock', '~> 3.18', '>= 3.18.1'
end