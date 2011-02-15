module Itiel
  module Transformations
    class FieldRename
      include InputOutputBehavior

      attr_accessor :mappings

      def initialize(*args)
        self.mappings = args
      end

      def transform!(input_stream)
        old_keys = self.mappings.first.keys
        @all_keys = input.first.keys

        transformed_output = []
			  input.each do |object|
          element = {}
          @all_keys.each do |k|
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
