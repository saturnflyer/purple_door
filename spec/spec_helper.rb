if ENV["RAILS_ENV"] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts 'required simplecov'
end

RSpec.configure do |config|
end
