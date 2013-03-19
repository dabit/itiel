module Itiel
  module Transform
    #
    # This class allow us to create multiple columns or replace the current value of a column
    # by the result of the execution of a block, you must return a hash with the columns you
    # wish to add as the hash keys.
    #
    # Example:
    #
    # calculated = CalculatedColumns.new do |row|
    #   total = row['price'] * row['quantity']
    #   tax   = total * 0.2
    #   { :total => total, :tax => tax }
    # end
    #
    # calculated.input = [{:price => 12.50, :quantity => 3},{:price => 4.95, :quantity => 5}]
    # calculated.output
    # => {:price => 12.50, :quantity => 3, :total => 37.5, :tax => 7.5},{:price => 4.95, :quantity => 5, :total => 24.75, :tax => 4.95}
    #
    # It is important to note that you have to use casting on numeric fields
    # just to make sure that it is from the right type. Stored column types
    # may vary depending on the source.
    #
    class CalculatedColumns
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :arguments

      def initialize(&block)
        raise "Missing block" unless block_given?
        @block = block
      end

      def transform!(input_stream)
        sanity_check
        input_stream.each do |object|
          object.merge! @block.call(object)
        end
      end

      def sanity_check
        raise "Undefined next_step" unless self.next_step
      end
    end
  end
end
