module Itiel
	class DataTable < ActiveRecord::Base
		def self.sources_file_path
			"config/sources.yml"
		end

		#
		# Always call from the body of a DataTable
		# to establish the connection to the database
		#
		def self.data_source(source_name)
			@@sources ||= YAML.load_file(sources_file_path)
			establish_connection @@sources[source_name.to_s]
		end

		#
		# Need to tell active_record the name of the table
		# for the current model
		#
		# By default returns the pluralized name of the class
		#
		def self.table_name
			self.name.demodulize.tableize
		end
	end
end
