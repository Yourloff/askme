source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'email_validator'
gem 'font-awesome-rails'
gem 'gravtastic'
gem 'importmap-rails'
gem 'jbuilder'
gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem "recaptcha", require: "recaptcha/rails"
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3', '~> 1.4'
end

group :production do
  gem 'pg'
end

group :development do
  gem 'web-console'
  gem 'byebug'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
