require 'test_helper'

describe Itiel::Load::ChainedStep do
  before :each do
    klass = Class.new
    klass.send :include, Itiel::Load::ChainedStep

    @step = klass.new
  end

  it "defines next_step" do
    assert_respond_to @step, :next_step
    assert_respond_to @step, :next_step=
  end

  describe :persist do
    it "raises an error if undefined" do
      assert_raises RuntimeError do
        @step.persist([])
      end
    end
  end

  describe :input= do
    before :each do
      @next_step = mock
      @input = [ mock ]
      @step.next_step = @next_step
      mock(Itiel::Logger).log_received(@step, @input.size)
      mock(Itiel::Logger).log_processed(@step, @input.size)
    end

    it "calls persist with the stream received through input= and sends it to next_step" do
      mock(@step).persist @input
      mock(@next_step).input = @input
      @step.input = @input
    end
  end
end
