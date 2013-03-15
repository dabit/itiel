require 'test_helper'

describe Itiel::Extract::ChainedStep do
  before :each do
    klass = Class.new
    klass.send(:include, Itiel::Extract::ChainedStep)
    @step = klass.new

    @stream = mock
  end

  describe "#start" do
    before :each do
      @next_step = mock
      @step.next_step = @next_step
    end

    it "extracts and sends the stream to the next step" do
      mock(@step).extract.returns @stream
      mock(@next_step).input=(@stream)

      @step.start
    end
  end

  describe "#extract" do
  	it "raises an exception" do
  		assert_raises RuntimeError do
  			@step.extract
  		end
  	end
  end
end
