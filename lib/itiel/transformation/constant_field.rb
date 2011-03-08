module Itiel
  module Transformation
    #
    # This transformation appends a new Column
    # with a constant value to the data stream
    #
    #     Itiel::Transformation::ConstantField.new(:field => "Constant Value")
    #
    # Or, specify the column and the value later:
    #
    #     transformation = Itiel::Transformation::ConstantField.new
    #
    #     transformation.append = { :field => "Constant Value" }
    #
    class ConstantField
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :append

      def initialize(*args)
        self.append = args.first
      end

      def input=(stream)
        next_step.input = transform!(stream)
      end

      def transform!(input_stream)
        input_stream.collect do |row|
          row.merge(self.append)
        end
      end
    end
  end
end
