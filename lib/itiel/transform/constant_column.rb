module Itiel
  module Transform
    #
    # This transformation appends a new Column
    # with a constant value to the data stream
    #
    #     Itiel::Transform::ConstantColumn.new( "column" => "Constant Value")
    #
    # Or, specify the column and the value later:
    #
    #     transformation = Itiel::Transform::ConstantColumn.new
    #
    #     transformation.append = { "column" => "Constant Value" }
    #
  	# The resulting stream will have a column named "column" with the value
  	# "Constant Value" for all rows.
  	#
    class ConstantColumn
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :append

      def initialize(*args)
        self.append = args.first
      end

      def transform!(input_stream)
        input_stream.collect do |row|
          row.merge(self.append)
        end
      end
    end
  end
end
