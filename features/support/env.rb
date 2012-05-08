require 'itiel'
require 'csv'

Itiel::Logger.logger = Logger.new File.join('tmp', 'itiel.log')

Before '@database' do
  File.unlink 'test.db' if File.exists?('test.db')
  @database_config_path = File.join('features', 'support', 'database.yml')
end
