module Itiel
  module Transform
    #
    # This transformation only selects specific columns on the data stream
    #
    # Usage:
    #
    #     @transformer = Itiel::Transform::SelectColumn.new("order_id", "name")
    #
    # In the example, the output stream would only have the order_id and the name column
    # All other columns will be ignored
    #
    class SelectColumn
      include ChainedStep
      include Itiel::Nameable

  		attr_accessor :mappings

      def initialize(*args)
        self.mappings = args
      end

      def transform!(input_stream)
        selected_output = []
        input_stream.each do |object|
          selected_output << object.select {|key, value| self.mappings.include? key }
        end

        selected_output
      end
    end
  end
end
