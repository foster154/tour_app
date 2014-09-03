source 'https://rubygems.org'
ruby '2.1.2'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.1.0'
gem 'pg', '0.15.1'
gem 'sass-rails', '4.0.1'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '~> 3.1.1'
gem 'jquery-ui-rails', '4.2.1'
gem 'autoprefixer-rails' # automatically adds browser prefixes
gem 'turbolinks', '~> 2.2.1'
gem 'jbuilder', '1.0.2'
gem 'sprockets', '2.10.0'
gem 'bootstrap-sass', '3.2.0'
gem 'bcrypt-ruby', '3.1.2'
gem 'faker', '1.1.2'
gem 'carrierwave', '0.10.0' # now used only for user images. will convert to paperclip and then delete
gem 'mini_magick', '~> 3.7.0'
gem 'bootstrap_form', '2.1.0'
gem 'acts_as_list', '~> 0.4.0' # for re-ordering photos
gem 'geocoder', '~> 1.2.0' # for generating tour maps
gem 'gmaps4rails', '2.1.2' # for generating tour maps
gem 'jquery-turbolinks', '2.0.2'
gem 'rest_in_place', '2.5.0' # in-line editing of photo labels
gem 'will_paginate', '3.0.4' # pagination
gem 'bootstrap-will_paginate', '0.0.9' # pagination - figure out which one I'm using, delete the other
gem 'will_paginate-bootstrap', '1.0.0' # pagination - figure out which one I'm using, delete the other
gem 'devise', '3.2.4' # user authentication
gem 'fog', '1.3.1'
gem 'aws-sdk', '1.43.2' # S3 API
gem 'paperclip', '4.1.1' # file attachment syntax and callbacks
gem 's3_direct_upload', '0.1.7' # direct upload form helper and assets
gem 'delayed_job_active_record', '4.0.1' # processing background jobs (photo processing, photo deleting)
gem 'figaro', '0.7.0' # managing env and secret keys
gem 'stripe', '1.14.0' # payment processing
gem 'stripe_event', '1.3.0' # for Stripe webhooks
gem 'gibbon' # for email subscription

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  gem 'better_errors'
  # The following optional lines are part of the advanced setup.
  # gem 'guard-rspec', '2.5.0'
  # gem 'spork-rails', '4.0.0'
  # gem 'guard-spork', '1.5.0'
  # gem 'childprocess', '0.3.6'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.0'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  # Uncomment this line on OS X.
  gem 'growl', '1.0.3'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end