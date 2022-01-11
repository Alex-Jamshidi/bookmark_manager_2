ENV['RACK_ENV'] = 'test'
ENV['rspec'] = 'test'

require 'pg'

RSpec.configure do |config|
  config.before(:each) do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec('TRUNCATE TABLE bookmarks;')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.instagram.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    result = connection.exec('SELECT * FROM bookmarks')
  end
end


# Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Tell Capybara to talk to BookmarkManager
Capybara.app = BookmarkManager
require 'simplecov'
require 'simplecov-console'
require 'features/web_helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end