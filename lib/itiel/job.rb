module Itiel
  class Job
    #
    # Pass a block to this method to process the ETL steps in order
    #
    #
    # Understands a single line per step:
    #
    #     Itiel::Job.run do |job|
    #       job.step @source
    #       job.step @destination
    #
    #       ...
    #     end
    #
    #
    # In this case the @source.output is sent to the @destination's input
    # A third step on the list would send the @destination's output to its
    # input
    #
    #
    # Another way to do this is by passing hashes to the step method:
    #
    #     Itiel::Job.run do |job|
    #       job.step @source => @destination
    #     end
    #
    #
    # You want to use this sintax when creating more complex flows. For example,
    # you could send a step output to several inputs
    #
    #     Itiel::Job.run do |job|
    #       job.step @source => [ @destination, @second_destination ]
    #     end
    #
    #
    #
    def self.run(&block)
      yield self.new
    end

    #
    # Call inside the run block to denote a data flow
    #
    def step(*args)
      if args[0].is_a?(Hash)
        hash_based_step(args[0])
      else
        single_line_step(args[0])
      end
    end

    private
    def hash_based_step(*args)
      source, destination = args[0].first.to_a
      if destination.is_a?(Array)
        destination.each { |object| object.input = source.output }
      else
        destination.input = source.output
      end
    end

    def single_line_step(object)
      unless @stream
        @stream = object.output
      else
        object.input = @stream
        @stream = object.output
      end
    end
  end
end
