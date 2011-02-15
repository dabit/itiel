require 'itiel'

require 'minitest/spec'
require 'minitest/unit'
require 'minitest/autorun'

require 'bundler/setup'
require 'turn'

ENV['RAILS_ENV'] ||= 'test'

require 'support/source_schema'
require 'support/destination_schema'
require 'support/example'
