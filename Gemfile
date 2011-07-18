source :rubyforge

gem 'rails'
gem 'escape'
gem 'heroku'
gem 'pg'
gem 'uuidtools'
gem 'hashie'
gem 'composition_engine', '0.0.0' # :path => '/home/<username>/<path_to_checked_out_gem>' #for when you want to do gem development

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

group :test do
  gem 'sqlite3'
  gem 'rspec-rails', '>= 2.6'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'cucumber'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
  gem 'webrat'
end
