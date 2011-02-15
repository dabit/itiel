module Itiel
  module Outputs
    #
    # This module defines the input and output behavior for output steps
    #
    # Whenever an Output receives input, it calls persist! and then
    # wires the input and the output
    #
    # All the clasess in Itiel::Output should implement persist!
    #
    module InputOutputBehavior
      module InstanceMethods
        attr_reader :output

        def input=(input_stream)
          persist!(input_stream)
          self.output = input_stream
        end

        #
        # This method has to be implemented in the class
        #
        def persist!(input_stream)
        end

        private
        attr_writer :output
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
