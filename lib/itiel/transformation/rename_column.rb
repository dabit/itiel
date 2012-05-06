module Itiel
  module Transformation
    #
    # Renames a column in the data stream
    #
    # Usage:
    #
    #     @transformer = Itiel::Transformation::RenameColumn.new("order_id" => "id")
    #
    # This would rename the order_id column in the input stream to id
    #
    class RenameColumn
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :mappings

      def initialize(*args)
        self.mappings = args
      end

      def transform!(input_stream)
        old_keys = self.mappings.first.keys
        all_keys = input_stream.first.keys

        transformed_output = []
    	  input_stream.each do |object|
          element = {}
          all_keys.each do |k|
            if old_keys.include?(k)
              element[self.mappings.first[k]] = object[k]
            else
              element[k] = object[k]
            end
          end
          transformed_output << element
        end

        transformed_output
      end
    end
  end
end
