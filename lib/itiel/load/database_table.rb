module Itiel
  module Load
    #
    # Loads the stream into a database table.
    #
    # Usage:
    #
    #     @loader = Itiel::Load::DatabaseTable.new :connection, "table_name"
    #
    class DatabaseTable
      include ChainedStep
      include Itiel::Nameable
      include Itiel::DB::SQLConnectable

      attr_accessor :table_name, :debug

      def initialize(connection, table_name)
        self.connection = connection
        self.table_name = table_name
      end

      def persist(input_stream)
        puts input_stream if debug
        input_stream.each do |element|
          table.insert(element)
        end
      end

      def table
        @@db ||= self.class.sequel_connection(connection)
        @@db[table_name.to_sym]
      end
    end
  end
end
