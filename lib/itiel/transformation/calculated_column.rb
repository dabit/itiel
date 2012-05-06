module Itiel
  module Transformation
    #
    # This class allow us to create a new column or replace the current value of a column
    # by the result of the execution of a block
    #
    # Example:
    # calculated = CalculatedColumn.new 'total' do |columns|
    #     columns['quantity'] * columns['total']
    # end
    #
    # calculated.input = [{:price => 12.50, :quantity => 3},{:price => 4.95, :quantity => 5}]
    # calculated.output
    # => {:price => 12.50, :quantity => 3, :total => 37.5},{:price => 4.95, :quantity => 5, :total => 24.75}
    #
    class CalculatedColumn
      include ChainedStep
      include Itiel::Nameable

      attr_accessor :arguments

      def initialize(calculated_column, &block)
        raise "Missing block" unless block_given?
        @calculated_column = calculated_column
        @block = block
      end

      def transform!(input_stream)
        sanity_check
        input_stream.each do |object|
          object[@calculated_column] = @block.call(object)
        end
      end

      def sanity_check
        raise "Undefined next_step" unless self.next_step
      end
    end
  end
end
