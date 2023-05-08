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
  gem "byebug"
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

