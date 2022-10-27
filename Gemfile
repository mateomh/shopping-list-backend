source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

# Postgres Gem
gem 'pg'

# Kaminari
gem 'kaminari'

# PaperTrail keeps record of all the changes made to a model
gem 'paper_trail'

# Date calculations
gem 'days360'
gem 'timecop'

# Creates valid fake data for different types
gem 'faker'
gem 'faker-medical'

# Fabricate creates db objects quickly
gem 'fabrication'

# Authorization logic and tokens
gem 'cancancan'
gem 'jwt'

# Excel reading
gem 'roo'

# Excel writing
gem 'caxlsx'
gem 'axlsx'
gem 'caxlsx_rails'

# Image processing and resizesing
gem 'mimemagic'
gem 'mini_magick'

# PDF usage
gem 'wicked_pdf'
gem 'pdf-reader'
gem 'combine_pdf'

# Active Result transformation
gem 'pluck_to_hash'

# Active record extensions
gem 'active_interaction'
gem 'activerecord-import'

# GraphQl
gem 'graphql'
# gem 'graphql-preload'
gem 'graphql-query-resolver'
gem 'apollo_upload_server'


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # Debugging
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'byebug', platform: :mri
  gem 'pry-byebug'
  # Testing framework
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'capybara'
  # Matchers
  gem 'shoulda-matchers'
  gem 'db-query-matchers'
  # Graphql interface
  gem 'graphiql-rails'
  # Open API documentation generator
  gem 'rswag'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Mocking http calls
  gem 'webmock'
  # Cleaning data
  gem 'database_cleaner'
  # JSON validation
  gem 'json_expressions'
end