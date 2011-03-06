module Itiel
  module Transformations
    #
    # This transformation appends a new Column
    # with a constant value to the data stream
    #
    #     Itiel::Transformations::ConstantField.new(:field => "Constant Value")
    #
    # Or, specify the column and the value later:
    #
    #     transformation = Itiel::Transformations::ConstantField.new
    #
    #     transformation.append = { :field => "Constant Value" }
    #
    class ConstantField
      include InputOutputBehavior
      include Itiel::Nameable

      attr_accessor :append

      def initialize(*args)
        self.append = args.first
      end

      def transform!(input_stream)
        output_stream = []
        self.input.each do |row|
          output_stream << row.merge(self.append)
        end
        output_stream
      end
    end
  end
end
