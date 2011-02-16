module Itiel
  module Extractors
    #
    # Defines the behavior of input and outputs for the
    # Extractors classes
    #
    # Classes must implement a method call load!
    #
    # By default, Ignores the input
    #
    module InputOutputBehavior
      module InstanceMethods
        attr_accessor :input

        #
        # Caches the output, call with true to reload
        #
        def output(refresh = false)
          @output = (refresh ? load! : @output ||= load! )
        end

        #
        # This method has to be implemented on the class
        #
        def load! ; end

        protected
        def output=(value)
          @output = value
        end
      end

      def self.included(receiver)
        receiver.send :include, InstanceMethods
      end
    end
  end
end
