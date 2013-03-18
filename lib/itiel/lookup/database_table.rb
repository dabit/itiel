module Itiel
  module Lookup
    #
    # Joins the main data stream with another lookup stream and appends the specified
    # columns from the lookup stream to the input stream.
    #
    # Example:
    #
    # Set up a lookup to the *authors* table:
    #
    # @database_lookup = Itiel::Lookup::DatabaseTable.new
    # @database_lookup.connection = :test
    # @database_lookup.table_name = "authors"
    #
    # Join the "author_name" column on the input stream with the "name" column in the lookup stream.
    #
    # @database_lookup.lookup_columns = { "author_name" => "name" }
    #
    # Join the "id" column in the lookup stream as "author_id"
    #
    # @database_lookup.joined_columns = { "id" => "author_id" }
    #
    class DatabaseTable
      include ChainedStep
      include HashLookup
      include Itiel::DB::SQLConnectable

      attr_accessor :table_name

      def lookup_source
        db = self.class.sequel_connection(connection)
        db[table_name.to_sym.to_sym].all
      end
    end
  end
end
