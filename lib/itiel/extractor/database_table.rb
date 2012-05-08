require 'active_record'

module Itiel
  module Extractor
    #
    # Extracts all the contents from a Database table into the stream
    # and passes it on to it's next_step
    #
    # Usage:
    #
    #     @extractor            = Itiel::Extractor::DatabaseTable.new
    #     @extractor.connection = :test
    #     @extractor.table_name = 'test_table'
    #
    #
    class DatabaseTable < CustomSQL
      attr_accessor :table_name

      def extract
        db = self.class.sequel_connection(connection)
        db[table_name.to_sym].all
      end
    end
  end
end
