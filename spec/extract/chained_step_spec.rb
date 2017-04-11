require 'spec_helper'

describe Itiel::Extract::ChainedStep do
  before :each do
    klass = Class.new
    klass.send(:include, Itiel::Extract::ChainedStep)
    @step = klass.new

    @stream = double
  end

  describe "#start" do
    before :each do
      @next_step = double
      @step.next_step = @next_step
    end

    it "extracts and sends the stream to the next step" do
      allow(@step).to receive(:extract).and_return(@stream)
      allow(@next_step).to receive(:input=).and_return(@stream)

      @step.start
    end
  end

  describe "#extract" do
    it "raises an exception" do
      expect { @step.extract }.to raise_error Itiel::MethodNotImplementedException
    end
  end
end
