require 'test_helper'

describe Itiel::Scripting::ChainedStep do
  before :each do
    class Step
      include Itiel::Scripting::ChainedStep
    end

    @step = Step.new
  end

  it "raises an exception if no next_step is defined" do
    @step.next_step = nil
    assert_raises RuntimeError do
      @step.input = []
    end
  end

  it "raises an excepiton if the class does not implement execute" do
    @step.next_step = mock
    assert_raises RuntimeError do
      @step.input = []
    end
  end

  it "Calls execute passing the input stream as the parameter and bypasses the input" do
    data = mock
    next_step = mock
    next_step.expects(:input=).with(data).returns(true)
    @step.next_step = next_step
    @step.expects(:execute).returns(true)
    @step.input = data
  end
end
