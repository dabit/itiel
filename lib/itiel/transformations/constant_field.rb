module Itiel
  module Transformations
    class ConstantField
      include InputOutputBehavior

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
