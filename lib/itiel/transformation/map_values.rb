module Itiel
  module Transformation
    class MapValues
      include InputOutputBehavior
      include Nameable

      attr_accessor :mapping

      def initialize(mapping)
        self.mapping = mapping
      end

      def transform!(input_stream)
        output = []
        input_stream.each do |stream_row|
          new_row = {}
          stream_row.each do |column, value|
            if self.mapping.keys.include?(column)
              new_row[column] = self.mapping[column][value] || value
            else
              new_row[column] = value
            end
          end
          output << new_row
        end
        output
      end
    end
  end
end
