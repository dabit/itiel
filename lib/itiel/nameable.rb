module Itiel
  module Nameable
    module ClassMethods; end
  
    module InstanceMethods
      def step_name
        @@step_name
      end

      def step_name=(value)
        @@step_name ||= value
      end
    end
  
    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
