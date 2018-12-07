source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'puma', '~> 3.11'
gem 'mongoid', '~> 6.1.0'
gem 'knock'
gem 'active_model_serializers'
gem 'rest-client', '~> 2.0', '>= 2.0.2'
gem 'cancancan'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'

group :test do
  gem 'factory_bot_rails', "~> 4.0"
  gem "ffaker"
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-json_expectations'
  gem 'httparty'

end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
