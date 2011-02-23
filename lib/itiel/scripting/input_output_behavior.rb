module Itiel
  module Scripting
    #
    # This module defines the input and output behavior of
    # Scripting steps.
    #
    # Generaly, scripting doesn't alter the data stream so
    # input is bypassed to output.
    #
    # All classes that include this module must implement the
    # execute! method. That's where the script is run.
    #
    # Where to get the script or how to run it is up to each
    # class.
    #
    module InputOutputBehavior
      attr_reader :output

      def input=(input_stream)
        self.execute!
        self.output = input_stream
      end

      protected
      attr_writer :output
    end
  end
end
