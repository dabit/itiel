module Itiel
  class Transformation
    def transform!
      # Your Transformation DSL here
    end

    def transform(mapping_order_hash, &block)
      # Putting this in an Instance variable
      # while I figure out the right way to do it
      @mapping_order_hash = mapping_order_hash
      block.call
    end

    #
    # One to one mapping of fields
    #
    def map(*args)
      puts @mapping_order_hash
    end
  end
end
