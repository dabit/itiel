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
      include Itiel::DB::SQLConnectable

      attr_accessor :lookup_columns, :joined_columns, :table_name

      def lookup!(input_stream)
        output = []
        input_stream.each do |row|
          origin_column = lookup_columns.first[0].to_sym
          merge_data    = lookup_stream[row[origin_column]]
          row.merge!(merge_data)
        end
      end

      def lookup_stream
        lookup_source.inject({}) do |memory, row|
          clean_row = {}
          joined_columns.each do |original, target|
            clean_row[target.to_sym] = row[original.to_sym]
          end

          memory[row[lookup_columns.first[1].to_sym]] = clean_row
          memory
        end
      end

      def lookup_source
        db = self.class.sequel_connection(connection)
        db[table_name.to_sym.to_sym].all
      end
    end
  end
end
