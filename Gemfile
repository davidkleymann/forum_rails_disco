source 'https://rubygems.org'


gem 'rails', '~>4.0.0'
gem 'rails-disco', '~>0.5.0.rc3'

# Webserver
gem 'puma' #, '2.6.0'

# Database
gem 'sqlite3'
gem 'pg' if ENV['RAILS_ENV']=='nitrous'

# Asset Processors
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 1.2'

# Asset Compression
gem 'uglifier', '>= 1.3.0'

# View Support
gem 'jquery-rails'
gem 'turbolinks'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby',  '3.1.2'

# deployment
gem 'capistrano'

group :development, :nitrous do
  # improve error screen
  gem 'better_errors'
  gem 'binding_of_caller'
  # gem 'meta_request' -- using both fails

  # suppress noisy asset pipeline
  gem 'quiet_assets'  
end
