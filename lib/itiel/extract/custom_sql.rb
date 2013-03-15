require 'sequel'

module Itiel
  module Extract
    #
    # Creates a stream from the specified SQL query.
    # Connection must be defined on a file that's on
    # config/database.yml by default.
    #
    # Usage:
    #
    #     @custom_sql = Itiel::Extract::CustomSQL.new
    #     @custom_sql.connection = :test
    #     @custom_sql.script = 'SELECT * FROM some_table'
    #
    #
    # You can set a different path for the config file at class level
    #
    #     Itiel::Extract::CustomSQL.connection_file_path = 'path_to_my_config/database.yml'
    #
    class CustomSQL
      include ChainedStep
      include Itiel::DB::SQLConnectable
      include Itiel::Nameable

      attr_accessor :script

      def initialize(*args)
        self.script = args[0]
      end

      def extract
        db = self.class.sequel_connection(connection)
        db[script].all
      end
    end
  end
end
