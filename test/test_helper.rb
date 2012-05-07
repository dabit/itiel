#
# Make sure you only run this code once
#
unless defined?(TMP_DIR)
  require 'simplecov'
  SimpleCov.start do
    add_filter 'test'
  end

  require 'itiel'
  require 'rr'

  #require 'minitest/spec'
  #require 'minitest/unit'
  require 'minitest/autorun'

  require 'turn'

  ENV['RAILS_ENV'] ||= 'test'

  TMP_DIR = File.expand_path("#{File.dirname(__FILE__)}/../tmp")
  Dir.mkdir(TMP_DIR) unless File.exist?(TMP_DIR)

  log = Logger.new("#{File.dirname(__FILE__)}/../tmp/test.log")
  log.level = Logger::INFO
  Itiel::Logger.logger = log

  class MiniTest::Unit::TestCase
    include RR::Adapters::TestUnit
  end
end
