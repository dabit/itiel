module Itiel
  module Transformations
    class FieldRename
      include InputOutputDefinitions

      def initialize(*args)
        @@mappings = args
      end

      def transform!
        old_keys = @@mappings.first.keys
        @all_keys = input.first.keys

        transformed_output = []
			  input.each do |object|
          element = {}
          @all_keys.each do |k|
            if old_keys.include?(k)
              element[@@mappings.first[k]] = object[k]
            else
              element[k] = object[k]
            end
          end
          transformed_output << element
        end

        self.output = transformed_output

        transformed_output
      end
    end
  end
end
