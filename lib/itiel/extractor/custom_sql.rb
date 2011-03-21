require 'sequel'

module Itiel
  module Extractor
    #
    # Creates a stream from the specified SQL query.
    # Connection must be defined on a file that's on
    # config/database.yml by default.
    #
    # Usage:
    #
    #     @custom_sql = Itiel::Extractor::CustomSQL.new
    #     @custom_sql.connection = :test
    #     @custom_sql.script = 'SELECT * FROM some_table'
    #
    #
    # You can set a different path for the config file at class level
    #
    #     Itiel::Extractor::CustomSQL.connection_file_path = 'path_to_my_config/database.yml'
    #
    class CustomSQL
      include ChainedStep
      include Itiel::DB::SQLConnectable
      include Itiel::Nameable

      attr_accessor :script

      def initialize(*args)
        self.script = args[0]
      end

      def in_batches
        db     = self.class.sequel_connection(connection)
        offset = 0
        while db[script].limit(self.batch_size, offset).count > 0
          yield db[script].limit(self.batch_size, offset).all
          offset += self.batch_size
        end
      end
    end
  end
end
