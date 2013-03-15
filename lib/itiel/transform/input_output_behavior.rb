module Itiel
  module Transform
    #
    # This module defines the behavior for input and output
    # on all our transformations.
    #
    # Whenever a transformation receives input, it stores the result of
    # transform! on the output
    #
    # All the classes in tiel::Transformation should implement ransform!
    #
    module InputOutputBehavior
      module InstanceMethods
        def input=(input_stream)
          Itiel::Logger.log_received(self, input_stream.size)
          @input = input_stream
        end

        def input
          @input
        end

        #
        # Returns cached output by default, call it with true to run the
        # transformation before returning the output
        #
        def output(retransform = false)
          @output = (retransform ? transform!(self.input) : @output ||= transform!(self.input))
          Itiel::Logger.log_processed(self, @output.size)
          @output
        end

        #
        # This method has to be implemented in the class
        #
        def transform!(input_stream) ; end
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
