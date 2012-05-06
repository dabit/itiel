require 'test_helper'

describe Itiel::Loader::ChainedStep do
  before :each do
    class Step
      include Itiel::Loader::ChainedStep
    end

    @step = Step.new
  end

  it "defines next_step" do
    assert_respond_to @step, :next_step
    assert_respond_to @step, :next_step=
  end

  it "raises an error if persist is not defined" do
    assert_raises RuntimeError do
      @step.persist([])
    end
  end

  it "calls persist with the stream received through input=" do
    stream = []
    @step.expects(:persist).with(stream)
    @step.input = stream
  end

  it "sends the stream to it's next step" do
    stream = []
    next_step = mock
    next_step.expects(:input=).with(stream)

    @step.next_step = next_step
    @step.stubs(:persist)
    @step.input = stream
  end
end
