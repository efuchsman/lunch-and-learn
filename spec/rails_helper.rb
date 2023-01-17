require 'simplecov'
SimpleCov.start
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'digest/md5'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('app_key') { ENV['edamam_api_key'] }
  config.filter_sensitive_data('app_id') { ENV['edamam_app_id'] }
  config.filter_sensitive_data('key') { ENV['YOUTUBE_API_KEY'] }
  config.filter_sensitive_data('client_id') { ENV['unsplash_access_key'] }
  config.default_cassette_options = { record: :new_episodes }
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true
end
