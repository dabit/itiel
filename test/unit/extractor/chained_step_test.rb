require 'test_helper'

describe Itiel::Extractor::ChainedStep do
  before :each do
    class Step
      include Itiel::Extractor::ChainedStep
    end

    @step = Step.new
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

    @step.expects(:in_batches).yields(stream)
    next_step.expects(:input=).with(stream)
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
