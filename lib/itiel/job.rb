module Itiel
  class Job
    attr_accessor :block
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
    def self.run(&block)
      Itiel::Logger.log_start_job(self)
      yield self.new
      Itiel::Logger.log_end_job(self)
    end

    #
    # Use it to define the job steps and then run the job at a later date.
    #
    # It returns an instance of a job, you can call run! on that instance later
    # to actually run the steps defined on the block of the job
    #
    # Uses the same syntax as run:
    #
    #     job = Itiel::Job.define do |job|
    #       job.step @source => @destination
    #     end
    #
    #     job.run!
    #
    # Or
    #
    #     job = Itiel::Job.define do |job|
    #       job.step @source
    #       job.step @destination
    #
    #       ...
    #     end
    #
    #     job.run!
    #
    def self.define(&block)
      self.new(&block)
    end

    #
    # Use it to run the steps on a previously defined Job
    #
    def run!
      Itiel::Logger.log_start_job(self)
      self.block.call(self)
      Itiel::Logger.log_end_job(self)
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
    def initialize(&block)
      self.block = block
      super
    end

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
