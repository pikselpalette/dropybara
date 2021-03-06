require 'bundler/setup'
require 'rack/file'
require 'capybara/rspec'
require 'selenium/webdriver'
require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage 100
end

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w[no-sandbox headless disable-gpu] }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.javascript_driver = :headless_chrome

Capybara.app = Rack::File.new File.dirname __FILE__

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL
end
