module Itiel
  class Transformation
    def transform!
      # Your Transformation DSL here
    end

    #
    # Transformation that updates or create a row
    # on the destination.
    #
    # Lookup is made via the specified criteria
    #
    def update_or_create(source_objects, destination_class, *criteria, &block)
      # Putting this in an Instance variable
      # while I figure out the right way to do it
      #
      result = []
      source_objects.each do |object|
        @new_object = destination_class.new
        @object = object
        block.call
        result << @new_object
      end
      result
    end

    #
    # One to one mapping of fields
    #
    def map(*args)
      source_column = args.first.keys.first
      destination_column = args.first.values.first
      @new_object.send("#{destination_column}=", @object.send(source_column))
    end
  end
end
