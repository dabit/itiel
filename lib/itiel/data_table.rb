module Itiel
	class DataTable < ActiveRecord::Base
		def self.sources_file_path
			"config/sources.yml"
		end

		def self.data_sources_yaml
			@@sources ||= YAML.load_file(config_file_path)
			puts @@sources
			raise "Sources Error" unless @@sources
		end

		def self.data_source(source_name)
			puts "Attempting to connect to #{source_name}"
			@@sources ||= YAML.load_file('/Users/dab/gems/itiel/test/support/config/sources.yml')
			establish_connection @@sources[source_name.to_s]
			#puts self.sources_file_path
			#puts "AAAAAAAA"
			#connection_settings = data_sources[source_name]
			#raise "No connection settings found for #{source_name}" unless connection_settings
			##establish_connection connection_settings
		end

		def self.table_name
			self.name.demodulize.tableize
		end
	end
end
