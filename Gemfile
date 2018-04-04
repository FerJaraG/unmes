source 'https://rubygems.org'

ruby "2.1.2"

gem 'rails', '4.1.2'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails4-autocomplete', '~> 1.1.0'

gem 'devise'
gem 'omniauth-facebook'
gem 'puma'
gem 'simple_form'
gem 'haml-rails'
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'social-share-button'
gem 'gon'
gem 'backstretch-rails'
gem 'newrelic_rpm'
#gem 'will_paginate', '~> 3.0'
gem 'kaminari'
gem 'rails-i18n', '~> 4.0.0'
gem 'rest-client' #for sending mails with mailgun
gem 'mandrill-api'
gem "sass-rails", "4.0.2"
gem 'pg'
gem 'uglifier'

group :production do
  gem 'rails_12factor'

end

group :development do 
  gem 'dotenv-rails'
  gem 'binding_of_caller'
  gem 'capistrano', '3.6.1', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-ssh-doctor', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'spring'
  gem 'better_errors'
end


