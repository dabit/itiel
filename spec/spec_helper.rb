require 'itiel'

TMP_DIR = File.expand_path("#{File.dirname(__FILE__)}/../tmp")
Dir.mkdir(TMP_DIR) unless File.exist?(TMP_DIR)

log = Logger.new("#{File.dirname(__FILE__)}/../tmp/test.log")
log.level = Logger::INFO
Itiel::Logger.logger = log

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  # config.warnings = true
end
