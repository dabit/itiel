describe Itiel::Transformation::ChainedStep do
  before :each do
    class Step
      include Itiel::Transformation::ChainedStep
    end

    @step = Step.new
  end

  it "defines input=" do
    assert_respond_to @step, :input=
  end

  it "defines setters and getters for next_step" do
    assert_respond_to @step, :next_step
    assert_respond_to @step, :next_step=
  end

  it "sets next_step.input as the result of transform!" do
    stream = mock
    next_step = mock
    @step.expects(:transform!).with(stream).returns(stream)
    next_step.expects(:input=).once.with(stream)
    @step.next_step = next_step
    @step.input = stream
  end
end
