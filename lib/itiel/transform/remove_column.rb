module Itiel
  module Transform
    #
    # This transformation only selects specific columns on the data stream
    #
    # Usage:
    #
    #     @transformer = Itiel::Transform::RemoveColumn.new("order_id")
    #
    # In the example, the output stream would not have the order_id column
    #
    class RemoveColumn
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :mappings

      def initialize(*args)
        self.mappings = args
      end

      def transform!(input_stream)
        selected_output = []
        input_stream.each do |object|
          selected_output << object.select {|key, value| !self.mappings.include? key }
        end

        selected_output
      end
    end
  end
end

