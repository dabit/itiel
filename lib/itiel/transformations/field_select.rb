module Itiel
  module Transformations
    class FieldSelect
      include InputOutputDefinitions

      def initialize(*args)
        @@mappings = args
      end

      def transform!
        selected_output = []
        input.each do |object|
          selected_output << object.select {|key, value| @@mappings.include? key }
        end

        self.output = selected_output

        selected_output
      end
    end
  end
end