require 'spec_helper'

describe Itiel::Transform::ChainedStep do
  before :each do
    class Step
      include Itiel::Transform::ChainedStep
    end

    @step = Step.new
  end

  it "defines input=" do
    expect(@step).to respond_to :input=
  end

  it "defines setters and getters for next_step" do
    expect(@step).to respond_to :next_step
    expect(@step).to respond_to :next_step=
  end

  it "sets next_step.input as the result of transform!" do
    stream    = double
    next_step = double

    expect(@step).to receive(:transform!).with(stream).and_return stream
    expect(next_step).to receive(:input=).with(stream)

    @step.next_step = next_step
    @step.input     = stream
  end

  it "raises an error if transform! is not defined" do
    expect { @step.transform!(double) }.to raise_error
  end
end

