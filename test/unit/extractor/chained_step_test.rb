require 'test_helper'

describe Itiel::Extractor::ChainedStep do
  before :each do
    klass = Class.new
    klass.send(:include, Itiel::Extractor::ChainedStep)
    @step = klass.new
  end

  it "defines next_step" do
    assert_respond_to @step, :next_step=
    assert_respond_to @step, :next_step
  end

  it "defines batch_size" do
    assert_respond_to @step, :batch_size=
    assert_respond_to @step, :batch_size
  end

  it "sets the input for next step by calling in_batches" do
    stream          = mock
    next_step       = mock
    @step.next_step = next_step

    mock(@step).in_batches.with_any_args do |*args|
      block = args.first
      mock(next_step).input=(anything)
      block.call
    end
    @step.start
  end

  it "raises an exception if the class does not implement in_batches" do
    assert_raises RuntimeError do
      @step.in_batches
    end
  end

  it "starts with a batch_size value of 20000 by default" do
    assert_equal 20000, @step.batch_size
  end
end
