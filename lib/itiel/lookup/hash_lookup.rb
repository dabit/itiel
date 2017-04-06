module Itiel
  module Lookup
    module HashLookup
      attr_accessor :lookup_columns, :joined_columns

      def lookup!(input_stream)
        output = []
        input_stream.each do |row|
          origin_column = lookup_columns.first[0].to_sym
          merge_data    = lookup_stream[row[origin_column]] || empty_joined_columns #{ origin_column => nil }
          row.merge!(merge_data)
        end
      end

      def lookup_stream
        @lookup ||= lookup_source.inject({}) do |memory, row|
          clean_row = {}
          joined_columns.each do |original, target|
            clean_row[target.to_sym] = row[original.to_sym]
          end

          memory[row[lookup_columns.first[1].to_sym]] = clean_row
          memory
        end
      end

      def empty_joined_columns
        joined_columns.inject({}) {|m,h| m[h[1].to_sym] = nil; m }
      end

      def lookup_source
        raise 'lookup_source is not implemented'
      end
    end
  end
end
